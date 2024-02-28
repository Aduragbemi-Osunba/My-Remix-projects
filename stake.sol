// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

 import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
/* this helps to write ERC20 with ease and gives functionality to everything we are using*/
 
 
contract MyToken is ERC20 {
// the name of contract is MyToken and the legal tender we are using is ERC20
 //Contract inherits from openzeppelin ERC20
 
mapping(address => uint) public staked;
/*its used to stored data and linking the address of the msg.sender to the amount(uint), visibility is set to public and name of the mapping is staked*/
//a mapping to store and keep track of staked amounts

mapping(address => uint) private stakedFromTS;
/*another mapping linking address to uint, visibility is set to private and name of mapping is called stakedFromTS*/
 //a mapping to store and keep track of the time when the staking occurred, TS means timestamp
 
    constructor() ERC20("MyToken", "MTK") {
/* a constructor to initializing the state variables in this contract, the name of my token as MyToken, and symbol as mtk to the deployer address*/
        _mint(msg.sender, 1000);
/* creating a new token with the address of the msg.sender and the amount is 1000 tokens*/
 // function allowing users to stake a specific amount which in this case is 1000 token
 
    }
 
 
 
function stake(uint amount) external{
/* creating a function to stake token and the amount you want to stake*/
 
require(amount >0, "amount is <=0");
/* amount to be staked should be greater than 0, if not there should be an error which says "amount is strictly 0'*/
 //also making sure the staker has enough money in the account

require(balanceOf(msg.sender) >= amount, "balance is <= amount");
/* balance of the sender must be greater than or strictly equals to the amount to be staked orelse an error should pop up saying balance is strictly less than the amount*/
//checking if the sender has enough balance

_transfer(msg.sender, address(this), amount);
/*then transfer from sender acount to the staked acount and amount to be staked*/
 
 
if(staked[msg.sender] > 0){
 
claim();
 
}
/* if the amount staked is greater than 0, amount should be claimed*/
 
stakedFromTS[msg.sender] = block.timestamp;
/* amount staked should start reflecting from the agreed time the stake is starting*/
 //updating the staking time in the mapping named staked from ts

staked[msg.sender] += amount;
/*amount staked by the spender and bonus should be added when need be*/
 //increasing the staked amount amount and adding it to the mapping named staked
 
}
 
 
 
function unstake(uint amount) external{
/*declairing function unstake is more like you're requesting for a refund, the amount staked is requested*/
 //external functon allows user to unstake a specified amount

require(amount >0, "amount is <=0");
/* amount to be staked should be greater than 0, if not there should be an error which says "amount is strictly 0'*/
 
require(staked[msg.sender] > 0, "You did not stake with us");
/*means that amount stakes should be greater than 0 but if its less than 0, it should give an error of you did not stake with us*/
 
stakedFromTS[msg.sender] = block.timestamp;
/* amount staked from the sender should start reflecting now*/

staked[msg.sender] -= amount;
/* the staked amount by the sender should be deducted from the staked account*/
 
_transfer(address(this), msg.sender, amount);
/*there should be a transfer from the staked account back to the sender account and the amount to be refunded*/
 
}
 
 
 
function claim() public {
//to claim or accept rewards
require(staked[msg.sender] > 0, "Staked is <= 0 ");
// amount staked is greater than 0
 
uint secondsStaked = block.timestamp - stakedFromTS[msg.sender];
/* for the seconds the spender sent the money it generated some rewards*/
uint rewards = staked[msg.sender] * secondsStaked / 3.154e7;
/* overall estimated rewards generated
_mint(msg.sender, rewards);
/* a new token is mint and sent to the address of the sender for its rewards depending on how long its staked*/

stakedFromTS[msg.sender] = block.timestamp;
 // updating the staking time in the mapping
 
 
}
 
   
 
}
 
 
