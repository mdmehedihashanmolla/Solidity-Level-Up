// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/// @title Shared Wallet Contract
contract SharedWallet {
    address public owner;
    mapping(address => uint) public balances;
    mapping(address => uint) public spendingLimits;

    event Deposited(address indexed user, uint amount);
    event Withdrawn(address indexed user, uint amount);
    event SpendingLimitSet(address indexed user, uint limit);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function setSpendingLimit(address user, uint limit) public onlyOwner {
        spendingLimits[user] = limit;
        emit SpendingLimitSet(user, limit);
    }

    function withdraw(uint amount) public {
        require(amount > 0, "Withdraw amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        require(amount <= spendingLimits[msg.sender], "Exceeds spending limit");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

        emit Withdrawn(msg.sender, amount);
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
