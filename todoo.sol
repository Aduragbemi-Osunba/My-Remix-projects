// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev{

    struct Micro{
        string Title;
        bool Completed;
    }
    Micro [] public tech;

    function Insert(string memory _Title) public  {
        tech.push(Micro(_Title,false));
    }
    function update(uint Index, string memory _Title) public {
        tech[Index]. Title = _Title;
    }
}