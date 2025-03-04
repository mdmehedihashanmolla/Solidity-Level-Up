// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//  Create a contract with a boolean state that toggles between true and false.

contract BooleanToggle {
    bool public value;

    constructor() {
        value = false;
    }

    function toggle() public {
        value = !value;
    }
}
