// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AccessControl {
    // Public Function -> Can be called internally and externally

    function publicFunction() public pure returns (string memory) {
        return "Publice Function called";
    }

    // Private Function: Can only be called within this contract

    function privateFunction() private pure returns (string memory) {
        return "Private function called";
    }
    // Internal Function : Can be called within this contract & derived contracts

    function internalFunction() internal pure returns (string memory) {
        return "Internal function called";
    }

    // External Function: Can only be called from outside the contract (not internally)

    function externalFunction() external pure returns (string memory) {
        return "External function called";
    }

    // Function to test private & internal functions

    function testFunctions()
        public
        pure
        returns (string memory, string memory)
    {
        return (privateFunction(), internalFunction()); // Can call private & internal
    }
}
// Derived contract to test function access
contract DerivedContract is AccessControl {
    // Function to call internal function (private function is NOT accessible)

    function callInternalFunction() public pure returns (string memory) {
        return internalFunction(); // Accessible since it's internal
    }
    // Cannot call `privateFunction()` as it's private to `AccessControl`
    // function callPrivateFunction() public pure returns (string memory) {
    //     return privateFunction(); // This would cause an error
    // }
}
