// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract rise{

 function make(uint x) public pure returns(uint){
        if (x<10){
        return  1;
        }else{
        return 100;
        }
 /*what this means is that if x(any input when you deply is less than 10, then your ans shld
  be 1 but if its more 10 then the ans shld be 100. this is a combination of both the if
 and else statement*/
    }
}