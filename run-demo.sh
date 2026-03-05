#!/bin/bash
set -e

# Load environment variables
source .env

echo "🚀 Deploying contracts on Fuji..."
forge create src/CrossChainNFT.sol:CrossChainNFT \
  --rpc-url $FUJI_RPC_URL \
  --private-key $PRIVATE_KEY \
  --etherscan-api-key $SNOWTRACE_API_KEY \
  --verify

forge create src/CCIPNFTBridge.sol:CCIPNFTBridge \
  --rpc-url $FUJI_RPC_URL \
  --private-key $PRIVATE_KEY \
  --etherscan-api-key $SNOWTRACE_API_KEY \
  --verify \
  --constructor-args $ROUTER_FUJI $NFT_FUJI

echo "🚀 Deploying contracts on Sepolia..."
forge create src/CrossChainNFT.sol:CrossChainNFT \
  --rpc-url $SEPOLIA_RPC_URL \
  --private-key $PRIVATE_KEY \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  --verify

forge create src/CCIPNFTBridge.sol:CCIPNFTBridge \
  --rpc-url $SEPOLIA_RPC_URL \
  --private-key $PRIVATE_KEY \
  --etherscan-api-key $ETHERSCAN_API_KEY \
  --verify \
  --constructor-args $ROUTER_SEPOLIA $NFT_SEPOLIA

echo "🔗 Configuring bridges..."
forge script script/ConfigureBridgeFuji.s.sol --rpc-url $FUJI_RPC_URL --broadcast
forge script script/ConfigureBridgeSepolia.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast

echo "🎨 Minting NFT on Fuji..."
forge script script/MintNFT.s.sol --rpc-url $FUJI_RPC_URL --broadcast

echo "🌉 Bridging NFT Fuji → Sepolia..."
forge script script/BridgeNFT.s.sol --rpc-url $FUJI_RPC_URL --broadcast

echo "✅ Demo complete! Check Snowtrace (Fuji) and Etherscan (Sepolia) for events."
echo "👉 Use backend API: curl http://localhost:3000/status/<txHash>"
echo "👉 Open frontend UI to confirm NFT status visually."
