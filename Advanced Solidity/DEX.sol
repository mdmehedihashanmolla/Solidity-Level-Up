// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "./IOracle.sol"; // Import the Oracle interface

contract DEX {
    IOracle public priceOracle; // Reference to an Oracle

    constructor(address _oracle) {
        priceOracle = IOracle(_oracle); // Set the Oracle contract
    }

    function getTokenPrice() public view returns (uint256) {
        return priceOracle.getPrice(); // Fetch price from Oracle
    }

    function buyToken(uint256 amount) public view returns (uint256) {
        uint256 price = priceOracle.getPrice();
        return amount * price; // Calculate cost
    }
}
