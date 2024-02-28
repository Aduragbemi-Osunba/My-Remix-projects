// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract piggyBank{
    event deposit (uint amount);
    event withdraw (uint amount);
    address public owner = msg.sender;

    receive() external payable{
        emit deposit(msg.value); /*features of fallback function, receive/fallback can be 
        used interchangeably. the fallback functn holds your money*/
    }

    function Withdraw() public {
 require(msg.sender == owner, "You are not the owner"); /*ie if the address doesnt match
youre not the owner*/
 emit withdraw(address(this).balance); //to check how much u have in a contract/current bal
 selfdestruct(payable(msg.sender));/* ie once you withdraw everything in your contract
your contract is closed*/
}
}

/*The aim of this is to save and deduct money from the piggybank. shld in case 
you dont want to close the contract or withdraweverything you just need to 
comment the self destruct part*/