//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {BurnMintTokenPool} from "@chainlink/contracts-ccip/src/v0.8/ccip/pools/BurnMintTokenPool.sol";
import {IBurnMintERC20} from "@chainlink/contracts-ccip/src/v0.8/shared/token/ERC20/IBurnMintERC20.sol";

contract PoolToken is BurnMintTokenPool {
    constructor(
        address myToken,
        address[] memory allowlist,
        address rmnProxyAddress,
        address routerAddress
    )
        BurnMintTokenPool(
            IBurnMintERC20(myToken),
            allowlist,
            rmnProxyAddress,
            routerAddress
        )
    {}
}
