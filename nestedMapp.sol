// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Adura{
    mapping (uint=>mapping (uint=>bool)) public data;

    function insert(uint _x, uint _y, bool value) public {
        data[_x][_y] = value;
    }

    function returnValue(uint _x, uint _y) public  view returns(bool){
        return data[_x][_y];
    }
}
/*nested mapping: it involves double dimmentional array. like when a name or address 
of an employee is mapped with multiple attributes(age, id etc)*/