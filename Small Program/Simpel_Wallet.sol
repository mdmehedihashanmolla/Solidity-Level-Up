// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Mapping Address to Balance: Implement a simple contract with a mapping that tracks user balances by address.

contract Simple_Wallet {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(_amount > 0, "Width amount must be greater than 0");
        require(balances[msg.sender] >= _amount, "Insufficient Balance");

        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
