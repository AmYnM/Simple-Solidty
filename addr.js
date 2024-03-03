const {ethers} = require("ethers");
const {formatUnits} = require("@ethersproject/units");
const { eth } = require("web3");

const provider =  new ethers.providers.AlchemyProvider('goerli', 'IzVDCl4McUWWfm7xV6f2qzMx_CV6L5RQ');

async function getBalance() {
    try {
        let address = "0x7Cd84fA273FC73171AFa983b3F4113c23f3235a4";
        let balance = await provider.getBalance(address);
        let ethBalance = formatUnits(balance, "ether")
        console.log("Get Balance", ethBalance);
        let block = await provider.getBlock();
        console.log("Block", block);
        let blockNumber = await provider.getBlockNumber();
        console.log("Block Number", blockNumber);
        // let gas = await provider.estimateGas();
        // console.log("Estimated gas", gas);
        // let ethBalances = formatUnits(eth, "ether")
        // console.log("Get Balance", eth);
    } catch(error) {
        console.error("Error getting balance",error);
    }    
}
getBalance();