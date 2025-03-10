// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract NumberGame {
    uint public limit;

    constructor(uint _limit) {
        limit = _limit;
    }

    function calculateSum(uint[] memory numbers) public pure returns (uint) {
        uint sum = 0;

        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];

            if (sum > 100) {
                revert("Sum exceeds the limit");
            }
        }
        return sum;
    }
}
