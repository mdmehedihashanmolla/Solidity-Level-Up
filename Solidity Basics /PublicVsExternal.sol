// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract PublicVsExternal {
    uint public counter;

    function incrementPublic() public {
        counter += 1;
    }
    function incrementExternal() external {
        counter += 1;
    }

    function testInternalCall() public {
        incrementPublic();
    }
}
