// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Good{

    enum Status {
        Pending,
        Shipped, 
        Accepted,
        Rejected,
        Cancelled
    }
    Status public status;
    function Get() public  view returns (Status) {return status;}
    function Set(Status _status) public { status = _status;}
    function cancel () public {status = Status.Cancelled;}
    function Reset() public  {delete status;}
}