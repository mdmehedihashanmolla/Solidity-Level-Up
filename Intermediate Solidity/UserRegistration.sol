// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract UserRegistration {
    mapping(address => string) public users; // Store users with their Ethereum address
    mapping(string => bool) private usernameTaken; // Store if a username is already used

    // Register function
    function register(string memory _username) public {
        require(bytes(_username).length >= 3, "Username must be at least 3 characters long!");
        require(!usernameTaken[_username], "Username already taken!");

        users[msg.sender] = _username; // Save the username for the sender
        usernameTaken[_username] = true; // Mark username as taken
    }

    // Get registered username of a user
    function getUsername(address _user) public view returns (string memory) {
        return users[_user];
    }
}
