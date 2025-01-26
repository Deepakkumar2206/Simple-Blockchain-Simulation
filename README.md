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

## Steps to set up the project:
1. Install dependencies: npm install
2. Compile the smart contract: truffle compile
3. Deploy the smart contract: truffle migrate --reset
4. Run the Truffle console: truffle console

## Inside the Truffle console, we can interact with the deployed contract using the following commands:
1. Get the deployed contract instance: let instance = await SimpleBlockchain.deployed();
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




## Explanation of the SimpleBlockchain.sol:

Struct Definition (Block):
Represents a block in the blockchain with the following attributes:
•	index: Position of the block in the chain.
•	timestamp: Time of block creation.
•	data: Information stored in the block.
•	previousHash: Hash of the previous block.
•	hash: Current block's hash.
•	nonce: Value used for proof-of-work.


State Variables:
•	Block[] public chain: Stores all blocks in the blockchain.
•	uint256 public difficulty: Determines the mining difficulty (default set to 2).

Constructor:
•	Creates the Genesis Block (first block) when the contract is deployed.
•	Calls createBlock("Genesis Block", bytes32(0)) to initialize the blockchain.

Function: createBlock(string memory data, bytes32 previousHash)
•	Generates a new block and mines it using proof-of-work:
             Calculates hash repeatedly until it meets the difficulty  threshold.
             Adds the block to the blockchain once mining is successful.

Function: calculateHash(...)
Computes a SHA-3 (keccak256) hash using the block properties (index, timestamp, data, previous hash, nonce).

Function: addBlock(string memory data)
•	Allows users to add a new block to the blockchain.
•	Takes the previous block's hash and creates a new block.


Function: getChain()
Returns the entire blockchain array (list of blocks).

Function: validateChain()
•	Checks the integrity of the blockchain by verifying:
•	Each block's hash is correctly computed.
•	The chain maintains a proper link to the previous block.

Function: difficultyThreshold()
Calculates the required hash threshold based on the difficulty level.





## Project Structure:

simple-blockchain/
  
  contracts/
      SimpleBlockchain.sol     # Smart contract code
      
  migrations/
      2_deploy_contracts.js     # Deployment script
  
  test/
      SimpleBlockchain.test.js  # Test cases (if any)
  
  truffle-config.js             # Truffle configuration
  
  package.json                  # Node dependencies
  
  README.md                     # Project documentation


## License
This project is licensed under the MIT License.





