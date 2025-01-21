// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AdditionCalculator {
    uint256 public a;
    uint256 public b;
    uint256 public result;

    constructor(uint256 _a, uint256 _b) {
        a = _a;
        b = _b;
        result = a + b;
    }

    function add() public view returns (uint256) {
        return a + b;
    }

    function setValues(uint256 _a, uint256 _b) public {
        a = _a;
        b = _b;
        result = a + b;
    }
}
