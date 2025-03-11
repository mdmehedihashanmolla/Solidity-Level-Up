// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
import "./StringUtils.sol";

contract NameRegistry {
    using StringUtils for string;

    mapping(address => string) private nameRecords;

    event NameRegistered(address indexed user, string name);

    function registerName(string memory name) public {
        require(bytes(name).length > 0, "Name Cannot be empty");
        nameRecords[msg.sender] = name;
        emit NameRegistered(msg.sender, name);
    }

    function getName(address user) public view returns (string memory) {
        return nameRecords[user];
    }

    function isSameName(
        address user1,
        address user2
    ) public view returns (bool) {
        return nameRecords[user1].compare(nameRecords[user2]);
    }

    function gtFullName(
        address user1,
        address user2
    ) public view returns (string memory) {
        return
            nameRecords[user1].concatenate(" ").concatenate(nameRecords[user2]);
    }
}
