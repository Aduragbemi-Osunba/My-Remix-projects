// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract temi{

  //  function me(uint b) public pure {require(b>=20, "it is less than 20");}
  //function tea(uint m) public pure {require(m<=10, "the number you inputed is more than 10");}
  
  function me(uint x) public pure {require(x>30, "the input is less than 30");}


}

/* require is used to catch errors and it doesnt make use of return and returns
it works like if, we shld have used string memory in those words but we are not returning 
anything
Class Work
 
Create a function that receive an input from the frontend and check 
if the input is greater than 30. If it is greater than 30 
the code should go through else the code should through an error "The input is less than 30"*/