// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sendEth{

    /*function sendViaSend(address payable _TO) public  payable {
        bool sent = _TO.send(msg.value);
        require(sent, 'Failed to send Ether');}
        //it is not recommended for sending ether*/

    function sendViaCall(address payable _To) public payable {
        (bool sent, bytes memory data) = _To.call{value:msg.value}("");
        require(sent, 'Failed to send Ether');
    }
}