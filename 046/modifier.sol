// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// internal is same as protected used generally in inheritence
// public-> external -> internal -> private
contract SpecialNumber{
    uint private  num1;
    uint public  num2;
    uint internal num3;

    constructor(){
        num1=23;
        num2=34;
        num3=30;
    }

    function printNum1()public view returns(uint){
        return num1;
    }
}

contract AnotherSpecialNumber is SpecialNumber {
    function sum() public  view  returns(uint){
        return num2+num3;
    }
}

contract otherContract{
    uint public val;
    function getNum() public {
        SpecialNumber obj=new SpecialNumber();
        val=obj.printNum1();
    }
}