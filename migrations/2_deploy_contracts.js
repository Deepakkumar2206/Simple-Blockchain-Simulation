const SimpleBlockchain = artifacts.require("SimpleBlockchain");

module.exports = function (deployer) {
    deployer.deploy(SimpleBlockchain);
};
