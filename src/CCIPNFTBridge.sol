// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "./CrossChainNFT.sol";

contract CCIPNFTBridge {
    address public router;
    CrossChainNFT public nft;

    // Mapping of destination chain IDs to bridge addresses
    mapping(uint64 => address) public destinationBridges;

    // 🔹 New events for logging
    event NFTSent(uint256 tokenId, address indexed sender, address indexed recipient, uint64 destinationChainId);
    event NFTReceived(uint256 tokenId, address indexed recipient, uint64 sourceChainId);

    constructor(address _router, address _nft) {
        router = _router;
        nft = CrossChainNFT(_nft);
    }

    // Configure destination bridge
    function setDestinationBridge(uint64 chainId, address bridge) external {
        destinationBridges[chainId] = bridge;
    }

    // Send NFT cross-chain
    function sendNFT(uint64 destinationChainId, address recipient, uint256 tokenId) external {
        require(destinationBridges[destinationChainId] != address(0), "Destination bridge not set");

        // Transfer NFT to this bridge contract before sending
        nft.transferFrom(msg.sender, address(this), tokenId);

        // 🔹 Emit event for logging
        emit NFTSent(tokenId, msg.sender, recipient, destinationChainId);

        // Here you would call CCIP router to send the cross-chain message
        // (omitted for simplicity in this demo)
    }

    // Receive NFT from another chain
    function receiveNFT(uint256 tokenId, address recipient, uint64 sourceChainId) external {
        // Mint NFT on destination chain
        nft.mint(recipient);

        // 🔹 Emit event for logging
        emit NFTReceived(tokenId, recipient, sourceChainId);
    }
}
