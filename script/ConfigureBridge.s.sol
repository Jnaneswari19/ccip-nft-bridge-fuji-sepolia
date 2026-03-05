// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Script.sol";
import "../src/CCIPNFTBridge.sol";

contract ConfigureBridgeFuji is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Fuji bridge contract (checksummed address)
        CCIPNFTBridge fujiBridge = CCIPNFTBridge(0xYourFujiBridgeAddress);

        // Configure Fuji bridge to know Sepolia bridge
        fujiBridge.setDestinationBridge(
            11155111, // Sepolia chainId
            0xYourSepoliaBridgeAddress // Sepolia bridge contract address
        );

        vm.stop