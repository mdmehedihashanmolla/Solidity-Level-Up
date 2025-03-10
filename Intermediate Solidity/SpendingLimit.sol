// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SpendingLimit {
    address public owner;
    uint public maxSpend;

    constructor(uint _maxSpend) {
        owner = msg.sender;
        maxSpend = _maxSpend;
    }
    // Modifier : Restrict spending to maxSpend
    modifier withinLimit(uint amount) {
        require(amount <= maxSpend, "Transaction exceeds spending limit");
        _;
    }
    function setMaxSpend(uint _newLimit) public {
        require(msg.sender == owner, "Only owner can change limit!");
        maxSpend = _newLimit;
    }

    function spend(uint amount) public withinLimit(amount) {
        // Spending Logic
    }
}
