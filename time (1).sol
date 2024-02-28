// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//how to generate time

contract time{
    uint public second = block.timestamp + 1 seconds;
//block.timestamp means now, so we saved it a state variable called second but it can be any name

   uint public startAt = block.timestamp + 1 minutes ;

   uint public endAt = block.timestamp + 20 minutes;

   uint public hour = block.timestamp + 1 hours;

   uint public day = block.timestamp + 1 days;
}

/* FOR INST if you want to do a funding program and its starting in 2days time
just do the block.timestamp + 2days, then deploy and the number given under the deploy
section then paste under the startAt. if its ending in 32days time, block.timestamp + 32days
then deploy and the numbers gotten should be put at the endAt*/