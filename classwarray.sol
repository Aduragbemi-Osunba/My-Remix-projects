// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mide{

    struct tech4dev{
    uint age;
    string name;
    uint password;
    string username;
    string emailAddress;
    }

    tech4dev[] public success;
    function insert(
uint age, string memory name, uint password, string memory username, string memory emailAddress) 
public {tech4dev memory victoria = tech4dev(age, name, password, username, emailAddress);

        success.push(victoria);
    }

}
//Class Work
 
/*Create a registration form for the fellows
 at tech4dev where they can input their age, name, password, username and email address.*/