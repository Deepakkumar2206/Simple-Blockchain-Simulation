const path = require("path");
const HDWalletProvider = require("@truffle/hdwallet-provider");
const Web3 = require("web3");

module.exports = {
  contracts_build_directory: path.join(__dirname, "client/src/contracts"),
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545, 
      network_id: "*", 
    },
  },
  compilers: {
    solc: {
      version: "0.8.0", 
    },
  },
};