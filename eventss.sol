// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract temi{

event mide(uint x, uint y, uint result);

function add(uint x, uint y) public returns(uint) {uint result = x + y;

emit mide (x,y,result);
return result;
    
} 
}

/*the essence of events is to broadcast from backend to front end 
emit is pushing our work to the front end to see what we are doing
anytime you write an event emit is compulsory cos it broadcast the network

after deploying your input, just check where debug is click the arrow 
and the information about this transaction will be shown*/