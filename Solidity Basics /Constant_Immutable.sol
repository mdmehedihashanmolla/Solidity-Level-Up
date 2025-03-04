// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract GasOptimization {
    uint public normalValue = 100;

    // Constant variable (gas-efficient, stored in bytecode)
    uint public constant CONSTANT_VALUE = 200;

    // Immutable variable (gas-efficient, assigned once in the constructor)
    uint public immutable IMMUTABLE_VALUE;

    constructor(uint _immutableValue) {
        IMMUTABLE_VALUE = _immutableValue;
    }
    function updateNormalValue(uint _newValue) public {
        normalValue = _newValue;
    }
    function getValues() public view returns (uint, uint, uint) {
        return (normalValue, CONSTANT_VALUE, IMMUTABLE_VALUE);
    }
}
