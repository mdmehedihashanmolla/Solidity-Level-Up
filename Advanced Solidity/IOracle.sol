// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

interface IOracle {
    function getPrice() external view returns (uint256);
}
