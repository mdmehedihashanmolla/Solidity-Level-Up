// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract BankAccount {
    uint256 private balance;

    constructor() {
        balance = 0;
    }

    // Function to deposit money
    function deposit(uint256 amount) public {
        require(amount > 0, "Deposit amount must be greater than zero");
        balance += amount;
    }
    function withdraw(uint256 amount) public virtual {
        require(amount <= balance, "Insufficient balance");
        balance -= amount;
    }

    // Function to check balance (added for testing since balance is private)
    function getBalance() public view returns (uint256) {
        return balance;
    }
}

// Child contract

contract SavingsAccount is BankAccount {
    uint256 private constant MIN_BALANCE = 100;

    // Override withdraw function to enforce minimum balance rule

    function withdraw(uint256 amount) public override {
        require(
            getBalance() - amount >= MIN_BALANCE,
            "Cannot withdraw below minimum balance"
        );
        super.withdraw(amount);
    }
}
