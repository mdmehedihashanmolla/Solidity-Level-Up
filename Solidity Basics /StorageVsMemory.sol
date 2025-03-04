// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract StorageVsMemory {
    // state variable stored inside storage
    string public storedText = "Hi";

    function modifyStorage()public{
        storedText = "Modified";
    }

    function modifyMemory()public pure returns (string memory){
        string memory tempText = "Hi";
        tempText = "Modified";
        return tempText;
    }
}