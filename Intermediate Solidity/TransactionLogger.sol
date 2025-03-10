// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract TransactionLogger {
    // Event to log transaction

    event Transaction(
        address indexed sender,
        address indexed receiver,
        uint amount
    );

    // Function send Ether and log the transaction

    function sendEther(address payable _receiver) public payable {
        require(msg.value > 0, "Must send some Ether");

        _receiver.transfer(msg.value);

        // log the transaction
        emit Transaction(msg.sender, _receiver, msg.value);
    }
}
