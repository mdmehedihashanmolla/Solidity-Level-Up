// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// Base Contract

contract Vehicle {
    function start() public pure returns (string memory) {
        return "Vehicle started";
    }
}

contract Car is Vehicle {
    function drive() public pure returns (string memory) {
        return "Car is driving";
    }
}

contract Tesla is Car {
    function selfDrive() public pure returns (string memory) {
        return "Tesla is driving autonomously";
    }
}
