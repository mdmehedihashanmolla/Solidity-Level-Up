// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Counter {
    int256 public Value;

    constructor() {
        Value = 0;
    }

    function Increment() public {
        Value += 1;
    }

    function Decrement() public {
        Value -= 1;
    }

    function Reset() public {
        Value = 0;
    }
}
