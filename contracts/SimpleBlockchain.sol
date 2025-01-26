// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBlockchain {
    struct Block {
        uint256 index;
        uint256 timestamp;
        string data; 
        bytes32 previousHash;
        bytes32 hash;
        uint256 nonce;
    }

    Block[] public chain;
    uint256 public difficulty = 2;

    constructor() {
        // Create the genesis block
        createBlock("Genesis Block", bytes32(0));
    }

    function createBlock(string memory data, bytes32 previousHash) internal returns (bytes32) {
        uint256 index = chain.length;
        uint256 timestamp = block.timestamp;
        uint256 nonce = 0;
        bytes32 hash = calculateHash(index, timestamp, data, previousHash, nonce);
        while(uint256(hash) >= difficultyThreshold()) {
            nonce++;
            hash = calculateHash(index, timestamp, data, previousHash, nonce);
        }
        
        Block memory newBlock = Block(index, timestamp, data, previousHash, hash, nonce);
        chain.push(newBlock);
        return hash;
    }

    function calculateHash(uint256 index, uint256 timestamp, string memory data, bytes32 previousHash, uint256 nonce) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(index, timestamp, data, previousHash, nonce));
    }

    function addBlock(string memory data) public {
        bytes32 previousHash = chain[chain.length - 1].hash;
        createBlock(data, previousHash);
    }

    function getChain() public view returns (Block[] memory) {
        return chain;
    }

    function validateChain() public view returns (bool) {
        for (uint256 i = 1; i < chain.length; i++) {
            Block memory currentBlock = chain[i];
            Block memory previousBlock = chain[i - 1];

            if (currentBlock.hash != calculateHash(currentBlock.index, currentBlock.timestamp, currentBlock.data, previousBlock.hash, currentBlock.nonce)) {
                return false; // Chain is invalid
            }
        }
        return true; // Chain is valid
    }

    function difficultyThreshold() internal view returns (uint256) {
        return uint256(2**(256 - difficulty));
    }
}
