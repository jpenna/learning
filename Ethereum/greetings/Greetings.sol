pragma solidity ^0.4.11;

contract Greetings {
  string message;

  function Greetings() public {
    message = "I am ready!";
  }

  function setGreetings(string _message) public {
    message = _message;
  }

  function getGreetings() public constant returns (string) {
    return message;
  }
  
}