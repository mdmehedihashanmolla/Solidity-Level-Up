// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract TimeLockedWallet {
    address public owner;
    uint public unlockTime;

    constructor(uint _daysToLock) {
        owner = msg.sender;
        unlockTime = block.timestamp + (_daysToLock * 1 days);
    }

    // Modifier : Prevents function execution before unlock time

    modifier onlyAfterUnlock() {
        require(block.timestamp >= unlockTime, "Function locked");
        _;
    }

    function deposit() public payable {}

    function withdraw() public onlyAfterUnlock {
        require(msg.sender == owner, "Only owner can withdraw!");
        payable(owner).transfer(address(this).balance);
    }

    function timeLeft() public view returns (uint) {
        if (block.timestamp >= unlockTime) {
            return 0;
        }
        return unlockTime - block.timestamp;
    }
}
