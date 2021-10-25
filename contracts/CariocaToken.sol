// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CariocaToken {
  string public name = "CariocaToken";
  string public symbol = "CARI";
  string public standard = "Carioca Token v1.0";
  uint256 public totalSupply;

  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
  );

  // Approval
  event Approval(
    address indexed _owner, 
    address indexed _spender, 
    uint256 _value
  );
  
  mapping(address => uint256) public balanceOf;

  // allowance
  mapping(address => mapping(address => uint256)) public allowance;

  // Constructor
  constructor(uint256 _initialSupply) public {
    balanceOf[msg.sender] = _initialSupply;
    totalSupply = _initialSupply;
  }

  // Transfer 
  function transfer(address _to, uint256 _value) public returns (bool success){
    // Exception if account doesn't have enough
    require(balanceOf[msg.sender] >= _value);

    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    
    emit Transfer(msg.sender, _to, _value);

    return true;
  }

  // approve 
  // address _spender - account that we want to approve
  // to spend amount uint256 _value
  function approve(address _spender, uint256 _value) public returns (bool success) {

    // habdle the allowance - how much they are allow to spend
    allowance[msg.sender][_spender] = _value;

    // Approve event
    emit Approval(msg.sender, _spender, _value);

    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {

    // require _from has enough tokens
    require(_value <= balanceOf[_from]);
    // Require allowance is big enough
    require(_value <= allowance[_from][msg.sender]);
    // Change the balance 
    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    // update the allowance
    allowance[_from][msg.sender] -= _value;

    emit Transfer(_from, _to, _value);
    // Call the transfer event 
    return true;
  }

}
