// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DataTypeDemo {

    uint256 public myUint = 100;
    int256 public myInt = -50;
    bool public myBool = true;
    address public myAddress = msg.sender;
    string public myText = "Mehedi";
    bytes public myBytes = "abc";


    function getUint()public view returns(uint){
        return myUint;
    }
    function getInt()public view returns (int){
        return myInt;
    }
    function getAddress()public view returns(address){
        return myAddress;
    }
    function getBool()public view returns(bool){
        return myBool;
    }
    function getString()public view returns(string memory){
        return myText;
    }
    function getBytes()public view returns (bytes memory){
        return myBytes;
    }

    function modifyData(uint _uint, int _int, bool _bool, address _address, string memory _string, bytes memory _bytes)public{
        myUint = _uint;
        myInt = _int;
        myBool = _bool;
        myAddress = _address;
        myText = _string;
        myBytes = _bytes;

    }

}