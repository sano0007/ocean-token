import { ethers } from "hardhat";

async function main() {
  const OceanToken = await ethers.getContractFactory("OceanToken");
  const oceanToken = await OceanToken.deploy(100000000, 50);

  await oceanToken.waitForDeployment();

  console.log("Ocean Token Deployed: ", await oceanToken.getAddress());
  }

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
