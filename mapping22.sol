// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract temi{

mapping(address => uint) userbaby; 
//example of msg.sender

function setMyNumber(uint _myNumber) public {userbaby [msg.sender] = _myNumber;
} //the syntax for storing data in arrays is the same for mapping

function whatIsMyNumber() public view returns (uint){return userbaby[msg.sender];
}
}

/*create a mappng that captures wallet address and amount of a user.
create a function to add an amount and also create a function to view the amount inserted*/
