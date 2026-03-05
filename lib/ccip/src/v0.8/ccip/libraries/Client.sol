// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @notice Library containing CCIP message structures.
library Client {
    /// @notice A token amount for EVM chains.
    struct EVMTokenAmount {
        address token;   // Address of the ERC20 token
        uint256 amount;  // Amount of tokens
    }

    /// @notice A message from an EVM chain to any chain.
    struct EVM2AnyMessage {
        bytes receiver;              // ABI-encoded receiver address on destination chain
        bytes data;                  // ABI-encoded payload
        EVMTokenAmount[] tokenAmounts; // Tokens to transfer
        bytes extraArgs;             // Additional arguments (e.g., gas limit)
        address feeToken;            // Token used to pay fees (address(0) for native)
    }

    /// @notice A message from any chain to an EVM chain.
    struct Any2EVMMessage {
        bytes32 messageId;           // Unique ID of the message
        uint64 sourceChainSelector;  // Selector of the source chain
        bytes sender;                // ABI-encoded sender address
        bytes data;                  // ABI-encoded payload
        EVMTokenAmount[] tokenAmounts; // Tokens transferred
    }
}
