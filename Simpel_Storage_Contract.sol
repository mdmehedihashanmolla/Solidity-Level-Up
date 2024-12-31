// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Simple Storage Contract: Write a contract that stores, retrieves, and updates a single integer.

contract SimpleStorage {
    uint256 public number;

    constructor() {
        number = 7;
    }

    // Function To update the stored number
    function setNumber(uint _number) public {
        number = _number;
    }

    // Function to retrieve the stored number.
    function getNumber() public view returns (uint256) {
        return number;
    }
}
