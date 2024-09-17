// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract factorial {
    function fact(uint256 _x) public pure returns (uint256) {
        return _x < 2 ? 1 : _x * fact(_x - 1);
    }
}