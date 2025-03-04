// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract IntegerArray {
    uint[] public array;

    function addElement(uint _value) public {
        array.push(_value);
    }

    function getAllElements() public view returns (uint[] memory) {
        return array;
    }

    function getElement(uint _index) public view returns (uint) {
        require(_index < array.length, "Index out of bound");
        return array[_index];
    }
    function updateElement(uint _index, uint _value) public {
        require(_index < array.length, "Index out of bounds");
        array[_index] = _value;
    }

    function deleteElement(uint _index) public {
        require(_index < array.length, "Index out of bounds");
        delete array[_index];
    }

    function getLength() public view returns (uint) {
        return array.length;
    }
}
