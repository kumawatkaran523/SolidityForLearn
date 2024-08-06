// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Swap {

    uint256 num1;
    uint256 num2;
    function store(uint256 ,uint256 ) public {
        num1=num1+num2;
        num2=num1-num2;
        num1=num1-num2;

    }

    function retrieve() public view returns(uint256,uint256){
        return (num1,num2);
    }

}