// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

 contract solid{

address public  admin;

constructor() public {
 admin = msg.sender;
    }
 }


 /*my msg.address shouldnt be public cos its either mine or the company im working with
 if i add public before admin, my address will be made visible to all but if i dont
 add public before admin it wont be visble*/