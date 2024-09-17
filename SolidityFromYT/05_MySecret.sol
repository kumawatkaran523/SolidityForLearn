// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address owner;

    modifier Onlyowner{
        require(owner==msg.sender,"must be onwer");
        _;
    }

    constructor(){
        owner=msg.sender;
    }
}

contract SecretVault {
    string secret;

    constructor(string memory _secret) {
        secret=_secret;
    }

    function getSecret() public view returns(string memory){
        return secret;
    }
}

contract MySecret is Ownable {
    string s;

    constructor(string memory _secret) {
        SecretVault obj=new SecretVault(_secret);
        s=obj.getSecret();
        super;
    }

    function getSecret() public view Onlyowner returns(string memory){
        return s;
    }
}