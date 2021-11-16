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
    
    function fundProject() public payable{
        author.transfer(msg.value);
        funds += msg.value;
    }
    
    function changeProkectState(string calldata newState) public{
        state = newState;
    }
    
}