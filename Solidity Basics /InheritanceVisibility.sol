// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Parent {
    // Private function: Only accessible within Parent contract

    function privateFunction() private pure returns (string memory) {
        return "Private function called";
    }
    // Internal function : Accessible in Parent and derived contracts

    function internalFunction() internal pure returns (string memory) {
        return "Internal function called";
    }

    // Public Function: Accessible everywhere for testing

    function publiceFunction() public pure returns (string memory) {
        return "Public function called";
    }

    // Function to test private function only callable inside Parent

    function testPrivateFunction() public pure returns (string memory) {
        return privateFunction();
    }
}

contract Child is Parent {
    // Function trying to access internal function it will work

    function callInternalFunction() public pure returns (string memory) {
        return internalFunction();
    }

    // Function trying to access private function will fail

    // function callPrivateFunction() public pure returns (string memory) {
    //     return privateFunction(); // private is NOT inherited
    // }
}
