// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Script.sol";
import "../src/CrossChainNFT.sol";

contract MintNFT is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deployed contract address (checksummed)
        CrossChainNFT nft = CrossChainNFT(0x1fe09EB62150A0Ec80D9DAa413cFbF975A5a6a36);

        // Mint NFT to your wallet (checksummed)
        nft.mint(0x96D771b8826541562B72dEC96332B57e52F93511);

        vm.stopBroadcast();
    }
}
