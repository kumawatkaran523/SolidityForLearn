// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TicketMaster is ERC721{
    //whenever passing argument to parent constructor then just write its name and pass on the parameter
    constructor (string memory _TokenName,string memory _symbol) ERC721(_TokenName,_symbol){}
}



// import chai from "chai";

// const { expect } = chai;

// describe("TokenMaster", async () => {
//     describe("Deployment", async () => {
//         it("Set the token name at deployement", async () => {
//             const TokenMaster = await ethers.getContractFactory("TokenMaster");
//             let tokenMaster = await TokenMaster.deploy("TokenMasterName", "TM");

//             const name = await tokenMaster.name;
//             expect(name).to.equal("TokenMasterName");
//         })
//     })
// });
