pragma solidity ^0.4.11;

contract Owned {
  address owner;

  modifier onlyOwner() {
    require(owner == msg.sender);
    _;
  }

  function Owned() {
    owner = msg.sender;
  }
}
