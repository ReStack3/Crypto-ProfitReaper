import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
// import "@nomicfoundation/hardhat-foundry";

import "@nomicfoundation/hardhat-toolbox";

const INFURA_URL = "https://mainnet.infura.io/v3/0d79a9c32c814e1da6133850f6fa1128";

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  // networks: {
  //   hardhat: {
  //     forking: {
  //       url: INFURA_URL,
  //       blockNumber: 23282722,
  //     },
  //   },
  // },
  networks: {
    hardhat: {
      chainId: 1,
      forking: {
        url: INFURA_URL,
        blockNumber: 23282722, // 可指定某个历史区块
      },
      initialBaseFeePerGas: 1, // 避免 baseFee 导致交易失败
      // 手动指定模拟账户
      accounts: [
        {
          privateKey: "0x59c6995e998f97a5a0044966f09453853a21b63b6d37c9e6e3c0d6cf7d8f9b3a",
          balance: "1000000000000000000000", // 1000 ETH
        },
        {
          privateKey: "0x8b3a350cf5c34c9194ca0a03e2b8b72f43721b9b63c621f07f5e7c437a1edb8b",
          balance: "1000000000000000000000", // 1000 ETH
        },
        {
          privateKey: "0x0dbbe8f6f7d3f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5",
          balance: "1000000000000000000000",
        },
        {
          privateKey: "0xaaaabbbbccccddddeeeeffff1111222233334444555566667777888899990000",
          balance: "1000000000000000000000",
        }
      ]
    },
  },
};

export default config;
