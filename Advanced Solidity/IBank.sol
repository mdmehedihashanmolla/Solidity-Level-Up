// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Define the IBank interface
interface IBank {
    function deposit(uint256 amount) external;
    function withdraw(uint256 amount) external;
    function getBalance() external view returns (uint256);
}

// Implement the interface in SimpleBank contract
contract SimpleBank is IBank {
    mapping(address => uint256) private balances;

    function deposit(uint256 amount) external override {
        require(amount > 0, "Deposit must be greater than 0");
        balances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external override {
        require(amount > 0, "Withdraw must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
    }

    function getBalance() external view override returns (uint256) {
        return balances[msg.sender];
    }
}
