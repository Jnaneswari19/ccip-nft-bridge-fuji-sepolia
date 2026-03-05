# CCIP NFT Bridge (Fuji ↔ Sepolia)

![Solidity](https://img.shields.io/badge/Solidity-0.8.21-blue)
![Chainlink CCIP](https://img.shields.io/badge/Chainlink-CCIP-green)
![Avalanche Fuji](https://img.shields.io/badge/Avalanche-Fuji-red)
![Ethereum Sepolia](https://img.shields.io/badge/Ethereum-Sepolia-purple)

A cross‑chain NFT bridge demo using **Chainlink CCIP**, connecting **Avalanche Fuji** and **Ethereum Sepolia** testnets.  
This project includes smart contracts, Forge scripts, a backend logging API, a frontend status UI, and a one‑click demo script for evaluator‑ready reproducibility.

---

## 📂 Project Structure

```
ccip-nft-bridge-fuji-sepolia/
│
├── src/                # Solidity contracts
│   ├── CrossChainNFT.sol
│   └── CCIPNFTBridge.sol
│
├── script/             # Forge scripts
│   ├── MintNFT.s.sol
│   ├── ConfigureBridgeFuji.s.sol
│   ├── ConfigureBridgeSepolia.s.sol
│   └── BridgeNFT.s.sol
│
├── backend/            # Node.js API
│   ├── server.js
│   └── package.json
│
├── frontend/           # React demo
│   ├── src/components/BridgeStatus.js
│   └── package.json
│
├── run-demo.sh         # One-click demo script
├── .env.example        # Environment template
└── README.md           # Documentation
```

---

## 🚀 Quickstart

### 1. Clone Repo
```bash
git clone https://github.com/Jnaneswari19/ccip-nft-bridge-fuji-sepolia
cd ccip-nft-bridge-fuji-sepolia
```

### 2. Setup Environment
```bash
cp .env.example .env
```
Fill in your private key, RPC URLs, and API keys.

### 3. Run Demo Script
```bash
chmod +x run-demo.sh
./run-demo.sh
```

This will:
- Deploy contracts on Fuji & Sepolia  
- Configure bridges  
- Mint NFT on Fuji  
- Bridge NFT Fuji → Sepolia  

### 4. Check Transactions
- Fuji: [Snowtrace Explorer](https://testnet.snowtrace.io/)  
- Sepolia: [Sepolia Etherscan](https://sepolia.etherscan.io/)  

Look for `NFTSent` and `NFTReceived` events.

### 5. Backend API
```bash
cd backend
npm install
node server.js
```

Query transaction status:
```bash
curl http://localhost:3000/status/<txHash>
```

### 6. Frontend Demo
```bash
cd frontend
npm install
npm start
```

Open `http://localhost:3000` and use the **BridgeStatus** component to check transaction status visually.

---

## ✅ Evaluator Checklist

- [ ] Clone repo and set up `.env`  
- [ ] Run `./run-demo.sh` successfully  
- [ ] See transactions on Snowtrace & Sepolia  
- [ ] Confirm `NFTSent` and `NFTReceived` events  
- [ ] Backend `/status/:txHash` returns status  
- [ ] Frontend shows NFT bridge status  

---

## 📖 Tech Stack

- **Solidity 0.8.21** — Smart contracts  
- **Foundry (Forge)** — Deployment & scripting  
- **Chainlink CCIP** — Cross‑chain messaging  
- **Node.js + Express + Ethers.js** — Backend logging API  
- **React** — Frontend status UI  

---

## 🎯 Goal

This project demonstrates a reproducible, evaluator‑friendly **cross‑chain NFT bridge** workflow.  
It ensures transparency with event logging, backend status queries, and frontend visual confirmation.  

---
```

