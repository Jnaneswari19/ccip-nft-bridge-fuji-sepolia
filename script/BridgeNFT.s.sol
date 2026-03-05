// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Script.sol";
import "../src/CCIPNFTBridge.sol";

contract BridgeNFT is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Fuji bridge contract (checksummed address)
        CCIPNFTBridge fujiBridge = CCIPNFTBridge(0xYourFujiBridgeAddress);

        // Send NFT ID 1 to Sepolia
        fujiBridge.sendNFT(
            11155111, // Sepolia chainId
            0xYourWalletAddress, // recipient wallet (checksummed)
            1 // tokenId
        );

        vm.stopBroadcast();
    }
}
