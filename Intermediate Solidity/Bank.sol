// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Bank {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        if (_amount > balances[msg.sender]) {
            revert("Insufficient balance!");
        }
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
