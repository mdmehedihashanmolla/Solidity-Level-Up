// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract OnlyOwnerModifier {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }
    function restrictedAction() public onlyOwner {
        // only Owner can execute this
    }
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;
    }
}
