// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract gbemi{
function me (uint w) public pure{
    if (w<10){revert ("You cannot withraw more than 10");}
}
}
/* what this means is that if w is less than 10
show an error and revert that statement*/