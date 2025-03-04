// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract EthereumFeeStorage {
    uint public constant TRANSACTION_FEE = 0.001 ether;

    function getTransactionFee() public pure returns (uint) {
        return TRANSACTION_FEE;
    }
    function calculateTotalCost(
        uint _numTransaction
    ) public pure returns (uint) {
        return _numTransaction * TRANSACTION_FEE;
    }
}
