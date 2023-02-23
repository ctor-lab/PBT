// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./IPBTReceipantSelectable.sol";

import "../PBTSimple.sol";

abstract contract PBTSimpleReceipantSelectable is IPBTReceipantSelectable, PBTSimple {

    function transferTokenWithChipTo(
        address to,
        bytes calldata signatureFromChip,
        uint256 blockNumberUsedInSig,
        bool useSafeTransferFrom
    ) public virtual override {
        _transferTokenWithChipTo(to, signatureFromChip, blockNumberUsedInSig, useSafeTransferFrom);
    }

    function transferTokenWithChip(address to, bytes calldata signatureFromChip, uint256 blockNumberUsedInSig) public virtual override {
        transferTokenWithChipTo(to, signatureFromChip, blockNumberUsedInSig, false);
    }

}