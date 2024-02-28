// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract hi{

/*function tell(uint _x)public pure returns(uint){

if(_x<10){return 1;}   
else if(_x == 50){
return 2;
}else{
return 3;
}
}*/
function strong(uint b) public pure  returns(string memory){
    if(b<20){return "less than 20";}
    else if(b == 50){return "equals to 50";}
    else{return 'greater than 20';}
}
}














/*what this means is that, if _x is less than 10, the ans shld be 1 and if its more 
than 10 it should return 3. but if x is 50, it should return 2(using else if)*/















/*Class Work
Create a function that displays the result. If the inputed number is less than 20
 it will show less than 20 and if it is greater than 20, it will say greater than 20.
If it is equal to 50, it will say it is equal to 50.*/