// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
import "./ExternalCallTarget.sol";

contract ExternalCallTester {
    ExternalCallTarget target;

    constructor(address _targetAddress) {
        target = ExternalCallTarget(_targetAddress);
    }

    // Calls the external function (cheaper gas cost)
    function callExternalFunction() public view returns (string memory) {
        return target.externalFunction();
    }

    // Calls the public function (higher gas cost)
    function callPublicFunction() public view returns (string memory) {
        return target.publicFunction();
    }
}
