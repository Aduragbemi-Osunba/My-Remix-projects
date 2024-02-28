// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ten{

    function money()public  view returns(uint, uint, address){
        uint blocknumber =block.number;
        uint timestamp = block.timestamp;
        address sender = msg.sender;
        return (blocknumber, timestamp, sender);
    }

}









/*clas work
create a function that displays the block number,timestamp and
the address of the person interacting with the contract*/