// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ConstructorWithInitialValues {
    address public owner;
    uint public creationTime;
    string public greeting;

    constructor(string memory _greeting) {
        owner = msg.sender;
        creationTime = block.timestamp;
        greeting = _greeting;
    }

    function getDetails() public view returns (address, uint, string memory) {
        return (owner, creationTime, greeting);
    }
}
