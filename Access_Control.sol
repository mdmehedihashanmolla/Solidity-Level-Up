// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/// @title Access Control Contract
contract AccessControl {
    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be the zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function restrictedFunction() public onlyOwner {
        // Function logic here
    }
}
