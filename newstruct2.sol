// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mide{

    struct adura{
    string name;
    uint age;
    uint amount;
    uint phoneNumber;
    }
    adura[] public Iceprince; //array of struct

    adura beauty = adura("micheal", 10, 100, 2349037341868);
    //add the above to the array
    function gbemi()public {Iceprince.push(beauty);} //array.push()

}

//after this, when transacting insert 0 at the iceprince then deploy








/*class Work
 
Create a struct for the following: name,age,amount and phone number.
Then create an array of struct with array name IcePrince.
 
Then try to insert into the array of struct the following: Michael,10,100,2349037341868*/