// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract AddressVerification {
    address public deployer;

    constructor() {
        deployer = msg.sender;
    }

    function verifyAddress(address _addr) public view returns (bool) {
        if (_addr == address(0)) {
            return false;
        }
        if (_addr == deployer) {
            return true;
        }
        return false;
    }
}
