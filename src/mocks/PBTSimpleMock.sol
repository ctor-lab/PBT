// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../PBTSimple.sol";

contract PBTSimpleMock is PBTSimple {
    constructor(string memory name_, string memory symbol_)
        PBTSimple(name_, symbol_)
    {}

    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }

    function seedChipToTokenMapping(
        address[] memory chipAddresses,
        uint128[] memory tokenIds,
        bool throwIfTokenAlreadyMinted
    )
        public
    {
        _seedChipToTokenMapping(
            chipAddresses, tokenIds, throwIfTokenAlreadyMinted
        );
    }

    function getTokenData(address addr)
        public
        view
        returns (TokenData memory)
    {
        return _tokenDatas[addr];
    }

    function updateChips(
        address[] calldata chipAddressesOld,
        address[] calldata chipAddressesNew
    )
        public
    {
        _updateChips(chipAddressesOld, chipAddressesNew);
    }
}