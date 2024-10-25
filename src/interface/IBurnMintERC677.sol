// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBurnMintERC677 {
    error SenderNotMinter(address sender);
    error SenderNotBurner(address sender);
    error MaxSupplyExceeded(uint256 supplyAfterMint);

    event MintAccessGranted(address indexed minter);
    event BurnAccessGranted(address indexed burner);
    event MintAccessRevoked(address indexed minter);
    event BurnAccessRevoked(address indexed burner);

    function decimals() external view returns (uint8);

    function maxSupply() external view returns (uint256);

    function burn(uint256 amount) external;

    function burn(address account, uint256 amount) external;

    function burnFrom(address account, uint256 amount) external;

    function mint(address account, uint256 amount) external;

    function grantMintAndBurnRoles(address burnAndMinter) external;

    function grantMintRole(address minter) external;

    function grantBurnRole(address burner) external;

    function revokeMintRole(address minter) external;

    function revokeBurnRole(address burner) external;

    function getMinters() external view returns (address[] memory);

    function getBurners() external view returns (address[] memory);

    function isMinter(address minter) external view returns (bool);

    function isBurner(address burner) external view returns (bool);

    function decreaseApproval(
        address spender,
        uint256 subtractedValue
    ) external returns (bool success);

    function increaseApproval(address spender, uint256 addedValue) external;
}
