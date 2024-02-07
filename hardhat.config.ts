import {HardhatUserConfig} from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";
import {EnvUtils} from "./utils/envUtils";

dotenv.config();

// Check required environment variables
EnvUtils.checkEnvVariables([
  "SEPOLIA_RPC_URL",
  "PRIVATE_KEY",
]);

// Accessing Environment variables
const SEPOLIA_RPC_URL = process.env.SEPOLIA_RPC_URL!;
const PRIVATE_KEY = process.env.PRIVATE_KEY!;

console.log('🥶',SEPOLIA_RPC_URL)
console.log('🌸',PRIVATE_KEY)

const config: HardhatUserConfig = {
  solidity: "0.8.20",
  networks: {
    sepolia: {
      url: SEPOLIA_RPC_URL,
      accounts: [PRIVATE_KEY],
    },
  }
};

export default config;
