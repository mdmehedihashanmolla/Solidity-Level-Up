// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Struct Basics: Implement a contract to store and retrieve a user profile with name, age, and address.

contract UserProfile {
    // Define a struct to represent the user profile

    struct Profile {
        string name;
        uint age;
        address userAddress;
    }

    mapping(address => Profile) public profiles;

    function setProfile(string memory _name, uint _age) public {
        profiles[msg.sender] = Profile({
            name: _name,
            age: _age,
            userAddress: msg.sender
        });
    }
    function getProfile(
        address _user
    ) public view returns (string memory, uint, address) {
        Profile memory profile = profiles[_user];
        return (profile.name, profile.age, profile.userAddress);
    }
}
