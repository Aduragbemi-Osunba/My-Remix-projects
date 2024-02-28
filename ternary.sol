// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tell{

    function mea(uint _x) public pure returns(uint){
        return (_x<10 ? 1 : 2);
    }
}


/* what this implies is that if _x is less than 10 return(?) 1 
but if its greater (:) than 10 put 2. also note this is ternary operator 
and it doesnt use "else if" */