// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CrossChainNFT is ERC721, Ownable {
    uint256 private _tokenIds;

    constructor() ERC721("CrossChainNFT", "CCNFT") Ownable(msg.sender) {}

    function mint(address to) external onlyOwner returns (uint256) {
        _tokenIds++;
        _safeMint(to, _tokenIds);
        return _tokenIds;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://example.com/metadata/";
    }
}
