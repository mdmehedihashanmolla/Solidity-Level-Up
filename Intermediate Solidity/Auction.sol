// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Aucation {
    address public owner;
    address public highestBidder;
    uint public highestBid;
    bool public aucationEnded;

    event NewBid(address indexed bidder, uint amount);
    event AuctionWinner(address winner, uint amount);

    constructor() {
        owner = msg.sender;
    }

    function placeBid() public payable {
        require(!aucationEnded, "Aucation has ended!");
        require(
            msg.value > highestBid,
            "Bid must be higher than the current highest!"
        );

        highestBidder = msg.sender;
        highestBid = msg.value;

        emit NewBid(msg.sender, msg.value);
    }

    function endAuction() public {
        require(msg.sender == owner, "Only owner can end the Aucation ");
        require(!aucationEnded, "Auction already ended!");

        aucationEnded = true;

        emit AuctionWinner(highestBidder, highestBid);
    }
}
