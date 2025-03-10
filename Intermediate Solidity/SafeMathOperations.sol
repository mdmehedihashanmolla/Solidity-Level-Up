// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SafeMathOperations {
    uint public balance = 100;

    function safeDivide(uint _num1, uint _num2) public pure returns (uint) {
        require(_num2 != 0, "Cannot divide by zero");
        return _num1 / _num2;
    }

    function safeSubtract(uint _amount) public {
        require(_amount <= balance, "Not enough balance");
        balance -= _amount;
        assert(balance >= 0);
    }

    function getBalance() public view returns (uint) {
        return balance;
    }
}
