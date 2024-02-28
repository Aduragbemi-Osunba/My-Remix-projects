// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract fawole{

bool public checker;

function amaeachi(uint x) public returns(bool){
if(x>10){
checker = false;
return checker;
}else{
    checker = true;
    return checker;
}
}
}
/*what this implies is that if x is greater than 10
it shld give false but if its less than 10 it shld give me
true*/