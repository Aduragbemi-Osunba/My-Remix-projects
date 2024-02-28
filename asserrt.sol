// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tayo{

uint public  num = 123;
function testAssert() public view {
assert(num == 123);
}

function increase() public {
    num += 1;
}
}