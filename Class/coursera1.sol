// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Moneybox {
    uint public balance;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        balance += msg.value;
    }

    function withdraw(uint amt, address payable destAdd) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amt <= balance, "Not enough balance");

        destAdd.transfer(amt);
        balance -= amt;
    } 
}
