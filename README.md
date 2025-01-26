# Simple Blockchain Project

This project is a basic implementation of a blockchain using Solidity. 
It demonstrates the core functionalities of a blockchain, such as adding blocks, validating the chain, and adjusting difficulty.

## Features

- Create and add blocks to the blockchain.
- Validate the integrity of the blockchain.
- Adjustable difficulty level for mining.
- Genesis block initialization.

## Pre-requisites

Before running the project, we have to ensure whether the following things are installed:

- Node.js
- Truffle
- Ganache
- Solidity compiler in VScode

## We have to follow these steps to set up the project:
1. Install dependencies: npm install
2. Compile the smart contract: truffle compile
3. Deploy the smart contract: truffle migrate --reset
4. Run the Truffle console: truffle console

## Inside the Truffle console, we can interact with the deployed contract using the following commands:
1. Get the deployed contract instance:let instance = await SimpleBlockchain.deployed();
2. Get the blockchain difficulty: 
             let difficulty = await instance.difficulty();
             console.log(difficulty.toString());
3. Add a new block: await instance.addBlock("New Block Data");
4. Get the entire blockchain:
      let chain = await instance.getChain();
      console.log(chain);
5. Validate the blockchain:
       let isValid = await instance.validateChain();
       console.log(isValid);

## Project Structure:

simple-blockchain
  contracts
      SimpleBlockchain.sol     # Smart contract code
  migrations
      2_deploy_contracts.js     # Deployment script
  test
      SimpleBlockchain.test.js  # Test cases (if any)
  truffle-config.js             # Truffle configuration
  package.json                  # Node dependencies
  README.md                      # Project documentation

## License
This project is licensed under the MIT License.





