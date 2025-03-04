// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Simple Conditions: Write a contract that checks if a number is even or odd.

contract EvenorOdd {
    uint public number;
    constructor(uint _number) {
        number = _number;
    }
    function setNumber(uint _newNumber) public {
        number = _newNumber;
    }

    function Checking() public view returns (string memory) {
        if (number % 2 == 0) {
            return "Even";
        } else {
            return "Odd";
        }
    }
}
