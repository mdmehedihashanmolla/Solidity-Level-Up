// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract MappingStorageTest{
    mapping (address => uint) public balances;

    //  Function to update balance using direct state variable assignment

    function updateBalanceDirect(uint _amount)public{
        balances[msg.sender] = _amount;
    }

    // Function to update balance using local variable manipulation first

    function updateBalanceOptimized(uint _amount)public{
        uint tempBalance = balances[msg.sender];
        tempBalance = _amount;
        balances[msg.sender] = tempBalance;
    }
}