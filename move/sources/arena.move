module challenge::arena;

use challenge::hero::Hero;
use sui::event;

// ========= STRUCTS =========

public struct Arena has key, store {
    id: UID,
    warrior: Hero,
    owner: address,
}

// ========= EVENTS =========

public struct ArenaCreated has copy, drop {
    arena_id: ID,
    timestamp: u64,
}

public struct ArenaCompleted has copy, drop {
    winner_hero_id: ID,
    loser_hero_id: ID,
    timestamp: u64,
}

// ========= FUNCTIONS =========

public fun create_arena(hero: Hero, ctx: &mut TxContext) {
    // Create an arena object
    let arena = Arena {
        id: object::new(ctx),
        warrior: hero,
        owner: ctx.sender(),
    };

    // Emit ArenaCreated event with arena ID and timestamp
    event::emit(ArenaCreated {
        arena_id: object::id(&arena),
        timestamp: ctx.epoch_timestamp_ms(),
    });

    // Make it publicly tradeable
    transfer::share_object(arena);
}

#[allow(lint(self_transfer))]
public fun battle(hero: Hero, arena: Arena, ctx: &mut TxContext) {
    // Destructure arena to get id, warrior, and owner
    let Arena { id, warrior, owner } = arena;

    // Compare hero.hero_power() with warrior.hero_power()
    if (hero.hero_power() > warrior.hero_power()) {
        // Emit BattlePlaceCompleted event with winner/loser IDs
        event::emit(ArenaCompleted {
            winner_hero_id: object::id(&hero),
            loser_hero_id: object::id(&warrior),
            timestamp: ctx.epoch_timestamp_ms(),
        });

        // If hero wins: both heroes go to ctx.sender()
        transfer::public_transfer(hero, ctx.sender());
        transfer::public_transfer(warrior, ctx.sender());
    } else {
        // Emit BattlePlaceCompleted event with winner/loser IDs
        event::emit(ArenaCompleted {
            winner_hero_id: object::id(&warrior),
            loser_hero_id: object::id(&hero),
            timestamp: ctx.epoch_timestamp_ms(),
        });

        // If warrior wins: both heroes go to battle place owner
        transfer::public_transfer(hero, owner);
        transfer::public_transfer(warrior, owner);
    };

    // Delete the battle place ID
    object::delete(id);
}
