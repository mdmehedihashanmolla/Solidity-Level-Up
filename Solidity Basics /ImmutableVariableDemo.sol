// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ImmutableVariableDemo {
    address public immutable owner;

    constructor(address _owner) {
        require(_owner != address(0), "Invalid owner address");
        owner = _owner;
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
