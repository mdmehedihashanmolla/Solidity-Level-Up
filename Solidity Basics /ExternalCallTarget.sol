// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ExternalCallTarget {
    // External function: Can only be called from outside the contract
    function externalFunction() external pure returns (string memory) {
        return "External function called";
    }

    // Public function: Can be called internally & externally
    function publicFunction() public pure returns (string memory) {
        return "Public function called";
    }
}
