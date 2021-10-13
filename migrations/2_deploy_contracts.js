const CariocaToken = artifacts.require("CariocaToken");

module.exports = function (deployer) {
  deployer.deploy(CariocaToken, 1000000);
};
