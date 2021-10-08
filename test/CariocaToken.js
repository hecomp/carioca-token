const CariocaToken = artifacts.require("CariocaToken");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("CariocaToken", function (accounts) {
  it("sets the total supply upon deployment", function() {
    return CariocaToken.deployed().then(function(instance) {
      tokenInstance = instance;
      return tokenInstance.totalSupply();
    }).then(function(totalSupply) {
      assert.equal(totalSupply.toNumber(), 10000, 'sets the total supply to 1,000,000')
    })
  })
  // it("should assert true", async function () {
  //   await CariocaToken.deployed();
  //   return assert.isTrue(true);
  // });
});
