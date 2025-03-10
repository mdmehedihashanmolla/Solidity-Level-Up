// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract VotingSystem {
    struct Candidate {
        string name;
        uint voteCount;
    }

    address public owner;
    uint public votingDeadline;
    mapping(address => bool) public hasVoted;
    Candidate[] public candidates;

    event CandidateRegistered(string name);
    event Voted(address voter, string candidateName);

    constructor(uint _votingDurationInMinutes) {
        owner = msg.sender;
        votingDeadline =
            block.timestamp +
            (_votingDurationInMinutes * 1 minutes);
    }

    function registerCandidate(string memory _name) public {
        candidates.push(Candidate(_name, 0));
        emit CandidateRegistered(_name);
    }

    function vote(uint candidateIndex) public {
        require(block.timestamp < votingDeadline, "Voting Period has ended");
        require(!hasVoted[msg.sender], "You have already voted");
        require(candidateIndex < candidates.length, "Invalid candidate index");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount++;
        emit Voted(msg.sender, candidates[candidateIndex].name);
    }
    function getCandidateCount() public view returns (uint) {
        return candidates.length;
    }
    function getCandidate(
        uint index
    ) public view returns (string memory, uint) {
        require(index < candidates.length, "Invalid index");
        Candidate memory c = candidates[index];
        return (c.name, c.voteCount);
    }
    function getWinner() public view returns (string memory, uint) {
        require(block.timestamp > votingDeadline, "Voting is still ongoing.");

        if (candidates.length == 0) {
            return ("No candidates", 0);
        }

        uint maxVotes = 0;
        uint winnerIndex = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }
        return (candidates[winnerIndex].name, maxVotes);
    }
}
