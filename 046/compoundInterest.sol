// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SimpleInterest {
    uint256 p;
    uint256 t;
    uint256 r;
    uint256 n;
    uint256 CI;

    function setValue(uint256 _p,uint256 _t,uint256 _r,uint256 _n) public{
        p=_p;
        t=_t;
        r=_r;
        n=_n;
    }

    function calculateCI() public{
        CI=p*(1+(r/n))**(n*t);
    }

    function getCI() public view returns(uint256) {
        return CI;
    }
}