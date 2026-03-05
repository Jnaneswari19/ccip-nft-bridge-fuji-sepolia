// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/CrossChainNFT.sol";
import "../src/CCIPNFTBridge.sol";

contract Deploy is Script {
    function run() external {
        // Load deployer private key from environment
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy NFT contract
        CrossChainNFT nft = new CrossChainNFT();

        // ✅ Fuji CCIP Router address (checksummed)
        address router = 0xf694CD7Fc6a5fA5dc9Cb6efFFff8177F9e7E7E7e;

        // Deploy Bridge contract
        CCIPNFTBridge bridge = new CCIPNFTBridge(router, address(nft));

        // Mint a test NFT to deployer
        nft.mint(msg.sender);

        vm.stopBroadcast();
    }
}
