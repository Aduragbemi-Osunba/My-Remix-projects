// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ownable{

    address public owner;
    constructor() {
        owner = msg.sender;}

    modifier onlyOwner(){
        require( msg.sender == owner, "You are not the owner");
     _;}// the _; means execute the rest of the code

     function setOwner(address _newOwner) public onlyOwner{
    require(_newOwner != address(0) , "invalid addresss");
    owner = _newOwner;

     }
    function onlyOwnercancall() public  onlyOwner{
    }
    function anyonecancall() public {}
}
//more like changin ownership from the developer to the new company or owner