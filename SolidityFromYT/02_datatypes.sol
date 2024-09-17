// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Datatypes {
    uint public myuint=100;
    uint256 public myuint256=1000;

    string public mystring="String";

    struct myStruct{
        string name;
        uint roll;
    }

    myStruct public addData=myStruct("karan",46);

    uint[] public arr1=[1,2,3];
    string[] public arr2=["mango","apple","banana"];

    myStruct[] public arr3;

    function addValue(string memory _name,uint _roll) public{
        arr3.push(myStruct(_name, _roll));
    }
    
}