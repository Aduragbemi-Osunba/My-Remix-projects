// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "interf.sol";

contract ERC20 is IERC20{//meaning erc20 inheriting the functions inside the   contract deployed on ierc20 else the contract will not deploy
    uint public override totalSupply;
    mapping(address => uint) public  override balanceOf;
    mapping(address => mapping (address => uint)) public  override allowance;
    string public name = "MIKE TOKEN";//created a token which must have a neme, symbol& decimal
    string public  symbol = "MTK";
    uint public  decimal = 18;//the 18 means 18 decimal places
     
function transfer(address recipient, uint amount) external override returns(bool){
    balanceOf[msg.sender] -= amount;//a function of transfer explaining deduction/debit of token from  the sender account
    balanceOf[recipient] += amount;//sending and crediting the recipient account 

emit Transfer(msg.sender, recipient, amount);//informing the frontend about the transaction
return true;
}

function approve(address spender, uint amount) external  override  returns(bool) {
    allowance[msg.sender][spender] = amount;// sender giving the spender right over the allowance for spending
    emit  Approval(msg.sender, spender, amount);
    return  true;
}


function transferFrom(address sender, address recepient, uint amount) external override returns(bool) {
    allowance[sender] [msg.sender] -= amount;//deducting amount from sender acct 
    balanceOf[sender] -= amount; //sender acct after deducting the money
    balanceOf[recepient] += amount;// money added to the recepient acct
    emit Transfer(sender, recepient, amount);//making it known to the frontend
    return true;// return true if transaction is successful
}

function mint(uint amount) external {//after creating function mint, all mint will be added to sender acct and you specify how much to be created
    balanceOf[msg.sender] += amount;
    totalSupply += amount;
    emit  Transfer(address(0), msg.sender, amount);
}

function burn(uint amount) external  {
    balanceOf[msg.sender] -= amount;
    totalSupply -= amount;
    emit Transfer(msg.sender, address(0), amount);
    
}
 }
