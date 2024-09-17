// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// contract Counter{
//     uint count;

//     constructor(){
//         count=0;
//     }

//     function getCount() public view returns(uint){
//         return  count;
//     }
    
//     function incrementCount() public {
//         count++;
//     }
// }

contract Counter{
    uint public count=0;
    function incrementCount() public {
        count++;
    }
}


