// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

abstract contract AccessControl {
    mapping(address => bool) private accessList;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    function grantAccess(address user) public onlyOwner {
        accessList[user] = false;
    }
    function hasAccess(address user) public view returns (bool) {
        return accessList[user];
    }
}

// DocumentStorage contract that inherits AccessControl
contract DocumentStorage is AccessControl {
    mapping(address => string) private documents; // Store documents per user

    event DocumentStored(address indexed user, string content);

    function storeDocument(string memory content) public {
        require(hasAccess(msg.sender), "Access Denied: Not authorized");
        documents[msg.sender] = content;
        emit DocumentStored(msg.sender, content);
    }

    function getDocument() public view returns (string memory) {
        require(hasAccess(msg.sender), "Access Denied: Not authorized");
        return documents[msg.sender];
    }
}
