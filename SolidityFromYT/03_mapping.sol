// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mymapping {
    mapping (uint => string) public names;

    constructor(){
        names[1]="Karan";
        names[2]="Sejal";
        names[3]="Tushar";
        names[4]="Komal";
    }

    struct book{
        string bookName;
        string author;
    }

    mapping (uint => book) public books;

    function addBook(uint _id,string memory _bookName,string memory _author) public {
        books[_id]=book(_bookName,_author);
    }

    // nested mapping

    mapping (address=>mapping (uint=>book)) public myBooks;

    function addMyBook(uint _id, string memory _bookName, string memory _author) public {
        myBooks[msg.sender][_id]=book(_bookName,_author);
    }
}