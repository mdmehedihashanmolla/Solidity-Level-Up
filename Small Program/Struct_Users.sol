// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Struct for Users: Write a contract that uses a struct to store user details (name, age, etc.) and allows adding and updating users.

contract UserManagement {
    // Define a struct to store user details
    // The struct 'User' defines a template for storing user details, such as their name, age, and a flag to check existence.
    struct User {
        string name;
        uint age;
        bool exists; // To check if a user exists
    }

    // Mapping from address to User
    // This mapping associates an Ethereum address with a 'User' struct, allowing each address to store user-specific details.
    mapping(address => User) private users;

    // Event emitted when a new user is added
    // This event logs the addition of a new user, enabling external systems to monitor changes in user data on the blockchain.
    event UserAdded(address indexed userAddress, string name, uint age);

    // Event emitted when a user is updated
    // This event logs updates to existing user details for transparency and tracking.
    event UserUpdated(address indexed userAddress, string name, uint age);

    // Function to add a new user
    // Adds user details (name and age) to the mapping if they don't already exist.
    function addUser(string memory _name, uint _age) public {
        // This ensures that a user cannot add details if they already exist, preventing overwriting of existing data unintentionally.
        require(!users[msg.sender].exists, "User already exists");
        // This validates that the age provided is greater than zero, ensuring valid user data.
        require(_age > 0, "Age must be greater than zero");

        // Adds user details to the mapping
        users[msg.sender] = User({
            name: _name,
            age: _age,
            exists: true
        });

        // Emits the 'UserAdded' event, notifying external systems that a new user has been added.
        emit UserAdded(msg.sender, _name, _age);
    }

    // Function to update an existing user's details
    // Updates the name and age of an existing user in the mapping.
    function updateUser(string memory _name, uint _age) public {
        // Ensures the user exists in the mapping before updating.
        require(users[msg.sender].exists, "User does not exist");
        // Validates that the age provided is greater than zero.
        require(_age > 0, "Age must be greater than zero");

        // Updates the 'name' field of the existing user in the mapping.
        users[msg.sender].name = _name;
        // Updates the 'age' field of the existing user in the mapping.
        users[msg.sender].age = _age;

        // Emits the 'UserUpdated' event, notifying external systems of the update.
        emit UserUpdated(msg.sender, _name, _age);
    }

    // Function to get user details
    // Retrieves and returns the name and age of a user by their address.
    function getUser(address _userAddress) public view returns (string memory name, uint age) {
        // Ensures the user exists in the mapping before attempting to retrieve their details.
        require(users[_userAddress].exists, "User does not exist");

        // Retrieves the user's details from the mapping.
        User memory user = users[_userAddress];
        // Returns the user's name and age as output.
        return (user.name, user.age);
    }
}
