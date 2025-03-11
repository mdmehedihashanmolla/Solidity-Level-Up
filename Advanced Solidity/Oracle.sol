// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "./IOracle.sol";

contract Oracle is IOracle {
    uint256 private price = 1000;

    function setPrice(uint256 newPrice) public {
        price = newPrice;
    }

    function getPrice() external view override returns (uint256) {
        return price;
    }
}
