// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enum{
    enum Status { Waiting, Ready,Active}
    Status public state; 
    constructor(){
        state = Status.Waiting;
    }

    function Activate() public {
        state=Status.Active;
    }

    function IsActive() public view returns (bool){
        return (state ==Status.Active);
    }

    function Waiting() public {
        state=Status.Waiting;
    }

    function IsWaiting() public view returns (bool){
        return (state ==Status.Waiting);
    }

    function Ready() public {
        state=Status.Ready;
    }

    function IsReady() public view returns (bool){
        return (state ==Status.Ready);
    }
}