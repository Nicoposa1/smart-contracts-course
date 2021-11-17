// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {
    string public id;
    string public name;
    string public description;
    address payable public author;
    string public state = 'Oponed';
    uint public funds;
    uint public fundrisingGoal;
    
    constructor(string memory _id, string memory _name, string memory _description, uint _fundrisingGoal){
        id = _id;
        name = _name;
        description = _description;
        fundrisingGoal = _fundrisingGoal;
        author = payable(msg.sender);
    }
    
    modifier onlyAuthor(){
        require(
            msg.sender == author,
            "Only author can change the state of the project"
        );
        _;
    }
    
    modifier authorCantAport(){
        require(
            msg.sender != author,
            "The author can't aport her project"
        );
        _;
    }
    
    event newFund(
        address newInvestor,
        string newFunder
    );
    
    event changeState(
        address newState,
        string stateNew
    );
    
    function fundProject(string memory newInvestor) public payable authorCantAport{
        author.transfer(msg.value);
        funds += msg.value;
        emit newFund(msg.sender, newInvestor);
    }
    
    function changeProkectState(string calldata newState) public onlyAuthor{
        state = newState;
        emit changeState(msg.sender, newState);
    }
    
}