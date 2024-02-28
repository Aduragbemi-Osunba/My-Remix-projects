// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mimee{
    
    struct mike{
     string name;
     uint age;
    }
    mike[] public  tech4dev;

    function insert(string memory name, uint age) public {
        mike memory victoria = mike(name, age);

        tech4dev.push(victoria);
    }
}

/* then deploy, inside there you insert name and age you want. then add 0 to your struct 
name which is tech4dev, after this then call. all your data will be visible.
we used memory after mike bcos we want to save it inside our blockchain memory*/
