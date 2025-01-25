// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//Mapping Basics: Build a mapping that associates addresses with integer values.

contract AddressToInteger {
    mapping(address => uint) public balances;

    function setBalance(uint _value) public {
        balances[msg.sender] = _value;
    }

    // Function to get the balance associated with an address

    function getBalance(address _address) public view returns (uint) {
        return balances[_address];
    }

    function updateBalance(uint _newValue) public {
        balances[msg.sender] = _newValue;
    }

    function deleteBalance() public {
        delete balances[msg.sender];
    }
}
