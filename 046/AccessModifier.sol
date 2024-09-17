// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract1{
    uint public peopleCount=0;
    struct person{
        uint id;
        string firstname;
        string lastname;
    }
    mapping (uint => person) public people;
    address owner;
    modifier OnlyOwner{
        require(msg.sender==owner);
        _;
    }

    constructor (){
        owner=msg.sender;
    }
    function increment() private OnlyOwner {
        peopleCount++;
    }
    function addPerson(uint _id,string memory _firstname,string memory _lastname) public OnlyOwner {
        increment();
        people[peopleCount] = person(_id,_firstname,_lastname);
    }
}