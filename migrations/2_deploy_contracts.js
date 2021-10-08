const CariocaToken = artifacts.require("CariocaToken");

module.exports = function (deployer) {
  deployer.deploy(CariocaToken);
};
