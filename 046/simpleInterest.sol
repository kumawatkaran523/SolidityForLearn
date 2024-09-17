// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SimpleInterest {
    uint256 p;
    uint256 t;
    uint256 r;
    uint256 SI;

    function setValue(uint256 _p,uint256 _t,uint256 _r) public{
        p=_p;
        t=_t;
        r=_r;
    }

    function calculateSI() public{
        SI=(p*t*r)/100;
    }

    function getSI() public view returns(uint256) {
        return SI;
    }
}