// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract temi{

    struct database{
    string name;
    uint age;
    uint phonenumber;
    string houseaddress;
    string officeAddress;
    address walletAddress;
    string bestcolor;
  }
   database[] public tech4dev; //array of struct
    function insert(string memory name, uint age, uint phonenumber, string memory houseaddress, 
    string memory officeAddress, address walletAddress, string memory bestcolor) public { database
   memory success = database(name, age, phonenumber, houseaddress, officeAddress,
    walletAddress, bestcolor);
    tech4dev.push(success);
    }



}


/*classwork: create a database where users will be able to register with their name
age, phonenumber, house address, office address, wallet address and best color*/