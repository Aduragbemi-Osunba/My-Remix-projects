// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract mim{
 

uint public v=100;
function korea() public view returns (uint)
    {return v+1;}

function meet() public view returns (uint){
    return v -20;
}
    
function adura(uint amount, string memory name) public pure returns (uint, string memory){
    return(amount, name);
}

/*Class Work question
Create a variable and give it a name. Let the variable be equal to 100.
1. Create a function to add 1 to the state variable.
2. Create a function that subtract 20 from the state variable.
3 Create a function that takes an input amount and name from user*/
}





