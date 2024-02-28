// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Taiwo{

    uint[] public number = [100, 200, 300];

    function pushNumber() public {

        number.push(400);
    }
    function update () public  {
        number[1] = 77;
    }
    function remove() public {
        delete number[2];
    }
}