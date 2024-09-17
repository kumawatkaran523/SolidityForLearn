// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelBooking {
    enum status{
        vacant,
        occupied
    }

    status public currStatus;
    address public owner;

    constructor( ) {
        currStatus=status.vacant;
        owner=payable(msg.sender);
    }

    modifier OnlycurrStatusVacant{
        require(currStatus==status.vacant,"Occupied");
        _;
    }

    modifier cost(uint256 amt){
        require(msg.value>=amt,"No sufficient cost");
        _;
    }

    function book() public payable OnlycurrStatusVacant cost(2 ether){
        currStatus=status.occupied;
        (bool sent,byte memory data ) = owner.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }


}