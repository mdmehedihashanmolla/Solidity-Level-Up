// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ConstructorWithParameters {
    address public owner;
    uint public balance;

    constructor(address _owner, uint _initialBalance) {
        require(_owner != address(0), "Invalid Owner address");
        owner = _owner;
        balance = _initialBalance;
    }

    function getDetails() public view returns (address, uint) {
        return (owner, balance);
    }
}
