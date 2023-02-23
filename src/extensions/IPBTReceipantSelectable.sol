// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


interface IPBTReceipantSelectable {

    /// @notice Transfers the token into the message sender's wallet.
    /// @param to XXXsdf
    /// @param signatureFromChip An EIP-191 signature of (msgSender, blockhash), where blockhash is the block hash for blockNumberUsedInSig.
    /// @param blockNumberUsedInSig The block number linked to the blockhash signed in signatureFromChip. Should be a recent block number.
    /// @param useSafeTransferFrom Whether EIP-721's safeTransferFrom should be used in the implementation, instead of transferFrom.
    ///
    /// @dev The implementation should check that block number be reasonably recent to avoid replay attacks of stale signatures.
    /// The implementation should also verify that the address signed in the signature matches msgSender.
    /// If the address recovered from the signature matches a chip address that's bound to an existing token, the token should be transferred to msgSender.
    /// If there is no existing token linked to the chip, the function should error.
    function transferTokenWithChipTo(
        address to,
        bytes calldata signatureFromChip,
        uint256 blockNumberUsedInSig,
        bool useSafeTransferFrom
    ) external;

    /// @notice Calls transferTokenWithChip as defined above, with useSafeTransferFrom set to false.
    function transferTokenWithChip(address to, bytes calldata signatureFromChip, uint256 blockNumberUsedInSig) external;

}
