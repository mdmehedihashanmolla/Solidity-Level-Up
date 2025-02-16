// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/// @title Simple Voting System
contract VotingSystem {
    struct Proposal {
        string name;
        uint voteCount;
    }

    address public owner;
    Proposal[] public proposals;
    mapping(address => bool) public hasVoted;
    uint public votingDeadline;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    modifier onlyBeforeDeadline() {
        require(block.timestamp < votingDeadline, "Voting period has ended");
        _;
    }

    constructor(string[] memory proposalNames, uint durationInMinutes) {
        owner = msg.sender;
        votingDeadline = block.timestamp + (durationInMinutes * 1 minutes);

        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    function vote(uint proposalIndex) public onlyBeforeDeadline {
        require(!hasVoted[msg.sender], "You have already voted");
        require(proposalIndex < proposals.length, "Invalid proposal index");

        proposals[proposalIndex].voteCount += 1;
        hasVoted[msg.sender] = true;
    }

    function getWinningProposal() public view returns (string memory winningProposalName) {
        require(block.timestamp >= votingDeadline, "Voting is still ongoing");

        uint maxVotes = 0;
        uint winningIndex = 0;

        for (uint i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > maxVotes) {
                maxVotes = proposals[i].voteCount;
                winningIndex = i;
            }
        }

        return proposals[winningIndex].name;
    }

    function getProposalCount() public view returns (uint) {
        return proposals.length;
    }

    function getProposalDetails(uint index) public view returns (string memory, uint) {
        require(index < proposals.length, "Invalid proposal index");
        return (proposals[index].name, proposals[index].voteCount);
    }
}
