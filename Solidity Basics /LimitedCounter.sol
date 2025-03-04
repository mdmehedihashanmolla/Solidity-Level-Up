// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Counter {
    uint public count;
    uint public constant MAX_VALUE = 300;

    function increment() public {
        require(count < MAX_VALUE, "Count has reache the maximum llimit");
        count++;
    }

    function reset() public {
        count = 0;
    }

    function getCount() public view returns (uint) {
        return count;
    }
}
