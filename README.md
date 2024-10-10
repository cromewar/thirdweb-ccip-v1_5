## Thirdweb CCIP Example

### Getting started

1. Create .env file and provide the following values

```
PRIVATE_KEY=
AVALANCHE_FUJI_RPC_URL=
ARBITRUM_SEPOLIA_RPC_URL=
ETHEREUM_SEPOLIA_RPC_URL=
BASE_SEPOLIA_RPC_URL=
```

2. Compile contracts

```
forge build
```

3. Run tests

```
forge test
```

4. Deploy & Configure

Run:

```
source .env
```

Run:

```
forge script ./script/burnMintERC677/DeployTokenAndPool.s.sol:DeployTokenAndPoolScript --rpc-url avalancheFuji -vvv --broadcast
```

Run:

```
forge script ./script/burnMintERC677/DeployTokenAndPool.s.sol:DeployTokenAndPoolScript --rpc-url arbitrumSepolia -vvv --broadcast
```

Run:

```
forge script ./script/ConfigurePool.s.sol:ConfigurePoolScript --rpc-url avalancheFuji -vvv --broadcast --sig "run(address,uint64,address,address,bool,uint128,uint128,bool,uint128,uint128)" -- <AVALANCHE_FUJI_POOL_ADDRESS> <ARBITRUM_SEPOLIA_CHAIN_SELECTOR> <ARBITRUM_SEPOLIA_POOL_ADDRESS> <ARBITRUM_SEPOLIA_TOKEN_ADDRESS> false 0 0 false 0 0
```

Run:

```
forge script ./script/ConfigurePool.s.sol:ConfigurePoolScript --rpc-url arbitrumSepolia -vvv --broadcast --sig "run(address,uint64,address,address,bool,uint128,uint128,bool,uint128,uint128)" -- <ARBITRUM_SEPOLIA_POOL_ADDRESS> <AVALANCHE_FUJI_CHAIN_SELECTOR> <AVALANCHE_FUJI_POOL_ADDRESS> <AVALANCHE_FUJI_TOKEN_ADDRESS> false 0 0 false 0 0
```

5. Transfer tokens

Make sure you have some LINK tokens.

Go to Avalanche Fuji block explorer and find BurnMintERC677 contract address.

- Call `grantMintRole` function and provide your wallet address
- Call `mint` function and provide your wallet address and 100 as amount

Run:

```
forge script ./script/CCIPSend.s.sol:CCIPSendScript --rpc-url avalancheFuji -vvv --broadcast --sig "run(address,uint64,address,uint256,address,address)" -- <RECEIVER_ADDRESS> 3478487238524512106 <AVALANCHE_FUJI_TOKEN_ADDRESS> 100 0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846 0xF694E193200268f9a4868e4Aa017A0118C9a8177
```

Finally enter your transaction hash in the CCIP Block Explorer and monitor transfer in the real-time. For example, https://ccip.chain.link/msg/0xac9c44fe584dda9d8157c500d75ae77748717619d2f7ced36bf2b75360b41bd0

<br />

> This tutorial represents an educational example to use a Chainlink system, product, or service and is provided to demonstrate how to interact with Chainlink’s systems, products, and services to integrate them into your own. This template is provided “AS IS” and “AS AVAILABLE” without warranties of any kind, it has not been audited, and it may be missing key checks or error handling to make the usage of the system, product or service more clear. Do not use the code in this example in a production environment without completing your own audits and application of best practices. Neither Chainlink Labs, the Chainlink Foundation, nor Chainlink node operators are responsible for unintended outputs that are generated due to errors in code.
