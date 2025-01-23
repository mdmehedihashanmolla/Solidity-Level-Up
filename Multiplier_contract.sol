// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Multiplier: Implement a contract that multiplies an input by a stored factor.

contract Multiplier {
    uint public factor;

    constructor(uint _factor) {
        factor = _factor;
    }

    function setNewFactor(uint _newFactor) public {
        factor = _newFactor;
    }

    function multiply(uint number) public view returns (uint) {
        return number * factor;
    }
}
