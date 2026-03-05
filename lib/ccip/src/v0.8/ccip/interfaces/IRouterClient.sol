// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Client} from "../libraries/Client.sol";

/// @notice Interface for the CCIP Router contract.
/// The Router is responsible for sending and receiving cross-chain messages.
interface IRouterClient {
    /// @notice Sends a cross-chain message.
    /// @param destinationChainSelector The selector of the destination chain.
    /// @param message The message to send.
    /// @return messageId The ID of the message.
    function ccipSend(
        uint64 destinationChainSelector,
        Client.EVM2AnyMessage calldata message
    ) external payable returns (bytes32 messageId);

    /// @notice Returns the fee required to send a cross-chain message.
    /// @param destinationChainSelector The selector of the destination chain.
    /// @param message The message to send.
    /// @return fee The fee in wei.
    function getFee(
        uint64 destinationChainSelector,
        Client.EVM2AnyMessage calldata message
    ) external view returns (uint256 fee);
}
