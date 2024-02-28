// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*contract micheal{
    function me(uint _x) public pure returns(uint){
        return(_x<10 ? 1 : 2);
    }

}
 this ternary operator is the shorter form of dealing with if and else,
what this means is that is x is less than 10 return 1 but if its greater than 10 
return 2, it doesnt use else if

Class Work
 
Create a function that shows it is less than 20 if the input is less than 20 and greater
 than 20 if it is greater than 20.
Note: use ternary operator to solve this problem.*/

contract micheal{
    function me(uint _x) public pure returns(string memory){
        return(_x<20 ? "less than 20" : "greater than 20");
    }

}

