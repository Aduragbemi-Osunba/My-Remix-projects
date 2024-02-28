// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract daniel{
    //function modifier
bool public paused;
uint public count;

function setpause(bool x) external {
    paused = x;
}
 function increase() external {
    require(!paused);
    count +=1;
 }

 function decrease() external {
    require(!paused);
    count -=1;
 }


}
/* by default, your bool is false
by default, uint is 0. you can also use external in place of public
just insert either false or true in the setpause */