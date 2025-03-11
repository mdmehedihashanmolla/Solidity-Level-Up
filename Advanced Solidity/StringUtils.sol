// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

library StringUtils {
    // Function to concatenate two string

    function concatenate(
        string memory a,
        string memory b
    ) internal pure returns (string memory) {
        return string(abi.encode(a, b));
    }

    // Function to compare two strings (returns true if they are equal)

    function compare(
        string memory a,
        string memory b
    ) internal pure returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}
