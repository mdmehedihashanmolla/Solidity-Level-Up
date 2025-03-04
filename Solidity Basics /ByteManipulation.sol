// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ByteManipulation {
    bytes32 public storedBytes32;

    function storeBytes32(bytes32 _value) public {
        storedBytes32 = _value;
    }

    function stringToBytes32(string memory _str) public pure returns (bytes32) {
        require(bytes(_str).length <= 32, "string too long");
        bytes32 converted;
        assembly {
            converted := mload(add(_str, 32))
        }
        return converted;
    }
    function bytes32ToString(
        bytes32 _bytes
    ) public pure returns (string memory) {
        uint8 i;
        while (i < 32 && _bytes[i] != 0) {
            i++;
        }
        bytes memory result = new bytes(i);
        for (uint8 j = 0; j < i; j++) {
            result[j] = _bytes[j];
        }
        return string(result);
    }
    function extractBytes(bytes32 _data, uint _start, uint8 _length)public pure returns (bytes memory){
        require(_start + _length < 32, "Out of bounds");
        bytes memory extracted = new bytes(_length);
        for(uint8 i = 0; i<_length; i++){
            extracted[i] = _data[_start + i];
        }
        return extracted;

    }
}
