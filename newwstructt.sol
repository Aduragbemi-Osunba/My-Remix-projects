// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tete{

    struct tech4dev{
        uint age;
        string name;
        string gender;

    }
    tech4dev[] public  peace; //array of struct

    //create a new struct
    tech4dev beauty = tech4dev (15, "micheal fawole", "male");
    //add the above to the array
    //array.push();
    function lydia() public {peace.push(beauty);
}


}