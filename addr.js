const {ethers} = require("ethers");
const {formatUnits} = require("@ethersproject/units");
const { eth } = require("web3");

const provider =  new ethers.providers.AlchemyProvider('goerli', 'YOUR_API_KEY_HERE');

async function getBalance() {
    try {
        let address = "YOUR_ADDRESS_HERE ";
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
