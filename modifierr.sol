// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract functionmodifier{
    bool public  squid;
    uint public  count;

    modifier nameOfModifier(){
require(squid);
_;
    }
 function setpause(bool x) external {
    squid = x;
}
 function increase() public  nameOfModifier{
    
    count +=1;
 }

 function decrease() public  nameOfModifier {
    
    count -=1;
 }
   
}


/* with function modifier you dont have to repeat codes
Class Work
 
Create a function that can pause and unpause two other functions named increase and decrease.*/