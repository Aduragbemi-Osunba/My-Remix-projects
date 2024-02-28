// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract we{

    function take() public view  returns(address){
    address meat = msg.sender;
    return meat;
    }
}
    
// requirement needed to deploy for Address data type