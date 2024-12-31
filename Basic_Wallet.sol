// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract BasicWallet {
    // Event to log deposits.
    event Deposit(address indexed sender, uint256 amount);

    // Event to log withdrawls
    event Withdrawal(address indexed recipient, uint256 amount);

    // Payble keyword is require to accept Ether
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        emit Deposit(msg.sender, msg.value);
    }

    // Function to withdraw a specific amount of Ether from the contract
    function withdraw(uint256 _amount) public {
        require(_amount > 0, "Withdrawal amount must be greater than zero");
        require(
            address(this).balance >= _amount,
            "Insufficient contract balnace"
        );

        // Transfer the requested amount to the sender
        payable(msg.sender).transfer(_amount);
        emit Withdrawal(msg.sender, _amount);
    }
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

/*
    ** - Event to log deposits with sender address and amount
    ** -  Event to log withdrawals with recipient address and amount

    ** -  Deposit function allows users to send Ether to the contract
    ** -  'payable' keyword enables the function to accept Ether
    ** -  'msg.value' contains the amount of Ether sent with the transaction
    ** -  require ensures that the deposit amount is greater than zero

    ** -  Withdrawal function allows users to withdraw Ether from the contract
    ** -  Validates if the withdrawal amount is greater than zero and contract has sufficient balance
    ** -  'payable' and 'msg.sender' send the requested amount to the user
    ** -  'emit Withdrawal' logs the withdrawal event

    ** -  getBalance function returns the current Ether balance of the contract
    ** -  'view' function does not modify the state, only reads data

    ** -  'require' is used to check conditions before performing actions
    ** -  If the condition fails, the transaction reverts and the changes are undone
    ** -  'emit' is used to log events for off-chain tracking of contract activity

 */
