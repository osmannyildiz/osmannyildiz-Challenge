# Move Project Repo Template

> **Completed.** This was so much fun :)\
> **Package ID**: [0x2a1db49985b6a55fe882bc351626ed11a903e706230207969ed4dcaab171d204](https://suiscan.xyz/testnet/object/0x2a1db49985b6a55fe882bc351626ed11a903e706230207969ed4dcaab171d204/tx-blocks)\
> **UI**: [Click here](https://osmannyildiz.github.io/osmannyildiz-Challenge/)

This is a template for Workshop Students Project Submissions

## ⚠️ Important Notes
- **Do not rename** the `ui` and `move` folders
- **Do not edit** the test files
- All tests must pass for successful deployment

## Getting Started

### 1. Repository Setup
- Click `Use this template` and create a new repository
- Name it: `<YOUR-NAME>-Challenge` (e.g., `BuilderMare-Challenge`)
- Make sure the repository is **Public**
- Clone the repository:
  ```bash
  git clone <YOUR-REPO-URL>
  cd <YOUR-REPO-NAME>
  ```

### 2. Follow the Implementation Guide
- Read and complete the [STUDENT_GUIDE.md](./STUDENT_GUIDE.md)
- Implement all TODO items in both smart contracts and frontend
- Ensure all tests pass

### 3. Build and Test
```bash
# Build smart contracts
cd move
sui move build
sui move test

# Build frontend
cd ../ui
npm install
npm run build
```

### 4. Configure Your GitHub Pages Settings ⚠️
In your repository, go to Settings → Pages → Source, and change it from "Deploy from a branch" to "GitHub Actions"

### 5. Deploy and Commit
```bash
git add .
git commit -m "Complete all the TODOs"
git push origin main
```

## Live Deployment

⚠️ **IMPORTANT:** You need to configure your GitHub Pages settings (step 4 above) in order to see your deployed app!

Once you push your changes to the `main` branch:

1. **GitHub Actions** will automatically:
   - Build and test your smart contracts
   - Build your frontend application
   - Deploy to GitHub Pages

2. **Your app will be live at:**
   ```
   https://<YOUR-USERNAME>.github.io/<YOUR-REPO-NAME>/
   ```

3. **Monitor deployment:**
   - Go to your repository's `Actions` tab
   - Watch the build and deployment progress
   - Check the `deploy` job for the live URL


## 🔧 Development

### Local Development
```bash
# Start frontend development server
cd ui
npm install
npm run dev
```

### Smart Contract Development
```bash
# Build contracts
cd move
sui move build

# Run tests
sui move test

# Deploy to testnet
sui client publish
```

## "Admin Panel" Is Not Visible Issue

If you're unable to see the admin panels in your deployed application, it means your wallet address doesn't have the AdminCap. To resolve this issue, you need to use the address that published the package.

### Step 1: Get Your Wallet Address

First, check your available wallet addresses:

```bash
sui client addresses
```

This will display all your wallet addresses. Look for the one marked with `*` (active address) that was probably used for deploying your package.

### Step 2: Export Your Private Key

To use your wallet for admin operations, you'll need to export your private key:

```bash
sui keytool export --key-identity <YOUR-ALIAS>
```

Replace `<YOUR-ALIAS>` with the alias of your wallet (e.g., `condescending-cymophane`).

**Example output:**
```
╭────────────────────┬────────────────────────────────────────────────────────────────────────────────────────────╮
│ exportedPrivateKey │  suiprivkey1qr9xs5z77q6v8f5cumgcas0y3qavqch2x0lqvdnduqy49x0yun2k703zqwv                    │
│ key                │ ╭─────────────────┬──────────────────────────────────────────────────────────────────────╮ │
│                    │ │ alias           │  condescending-cymophane                                             │ │
│                    │ │ suiAddress      │  0xa11070a3877b77355a0afbc402559cae7501c666819f05491f0337016c219366  │ │
│                    │ │ publicBase64Key │  ADHRP+/iykiPas83db9JY2DcfNJbhrpdIKjGGzQIO39L                        │ │
│                    │ │ keyScheme       │  ed25519                                                             │ │
│                    │ │ flag            │  0                                                                   │ │
│                    │ │ peerId          │  31d13fefe2ca488f6acf3775bf496360dc7cd25b86ba5d20a8c61b34083b7f4b    │ │
│                    │ ╰─────────────────┴──────────────────────────────────────────────────────────────────────╯ │
╰────────────────────┴────────────────────────────────────────────────────────────────────────────────────────────╯
```

### Step 3: Connect Your Wallet

In your deployed application:
1. Click the "Connect Wallet" button
2. Import your wallet using the private key you exported
3. The admin panels should now be visible

### Important Security Notes

⚠️ **Never share your private key with anyone**
⚠️ **Use testnet addresses for development and testing**

## 🎯 Success Criteria

Your project is complete when:
- ✅ All smart contract tests pass
- ✅ All TODO items are implemented
- ✅ Frontend builds without errors
- ✅ App is successfully deployed to GitHub Pages
- ✅ All features work as expected