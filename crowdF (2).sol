// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
//interface IERC20 means this contract is interacting with an ierc20 token and its the legal tender we
//are using, more like we are requesting for naira so dont pay dollars
    function transfer(address, uint) external  returns(bool);
//this involves the address we are tranferring to and amount the donor wants to transfer
//we use external because it can be called outside the contract
    function transferFrom(address, address, uint) external returns(bool);
//transferfrom is about transferring from my account to the crowdf account and the amount 
//i am donating and returning a bool
}

contract crowdFund{
    event Launch(
        uint id,
//each campaign should be a unique id, which makes easily identifyable
        address indexed  creator,
//it must contain the address of the creator
        uint goal, //to raise money
        uint startAt,// when its starting
        uint endAt // when its ending
    );

event Cancel(uint id); // you need the id of the creator to cancel event
event Pledge(uint indexed id, address indexed caller, uint amount);
//how much token you want to transfer immediately
//by adding indexed means you want to filter something and want more accurate answer
event Unpledge(uint indexed id, address indexed caller, uint amount);
//like you requesting cancelling your pledge and want your money back
event Claim(uint id); // willl allow you claim your money
event Refund(uint id, address indexed caller, uint amount);
//if the amount we want is not upto what that was donated, its possible we refund everyone 
//their money back

struct Campaign{
    // Creator of campaign
        address creator;
        // Amount of tokens to raise
        uint goal;
        // Total amount pledged
        uint pledged;
        // Timestamp of start of campaign
        uint32 startAt;
        // Timestamp of end of campaign
        uint32 endAt;
        // True if goal was reached and creator has claimed the tokens.
        bool claimed;
}
   IERC20 public immutable token;
   // the immutable token means that the token wont be changed, ier20 stands as the legal tender
    // Total count of campaigns created.
    // It is also used to generate id for new campaigns.
    uint public count;
    // Mapping from id to Campaign
//it means creating a state variable named count, for eveery campaign added in a contract. the count
//shld increase by one like 001,002 etc
    mapping(uint => Campaign) public campaigns;
    // Mapping from campaign id => pledger => amount pledged
//we need mapping to look forthe particular campaign we want to donate to, so to identify it we need the id which is the 
//key uint which link us to the campaign. we name our mappings campaigns or any name we choose
    mapping(uint => mapping(address => uint)) public pledgedAmount;
//nested mapping
 
    constructor(address _token) {
//constructor can only b called once since our token is immutable
        token = IERC20(_token);
    }
    
function launch(uint _goal, uint32 _startAt, uint32 _endAt) external {
    //the time for the campaign is now or in te future
        require(_startAt >= block.timestamp, "start at < now");
    //block.timestamp ====current time, means the campaign shld start at a specific time but if you chose to donate 
    //before the starting time, it should give an error message of stat at is less than now
        require(_endAt >= _startAt, "end at < start at");
    
        require(_endAt <= block.timestamp + 90 days, "end at > max duration");//means from now to 90 days ie end time is 90 days
 
        count += 1;
        campaigns[count] = Campaign({
    //it involves our campaigns we created and saving then in a array of struct
            creator: msg.sender, //creator address
            goal: _goal, //goal is to raise money
            pledged: 0, // pledge is at default level cos it hasnt been donated to
            startAt: _startAt, //when its starting
            endAt: _endAt, //when its ending
            claimed: false //claimed is at default cos it donations hasnt started
        });
 
        emit Launch(count, msg.sender, _goal, _startAt, _endAt);
//emitting information to the frontend that cmpagn and started and donations shld start
    }
 
    function cancel(uint _id) external {
    //It enables us cancel the campaign but someone else who is not the creator cant cancel it
        Campaign memory campaign = campaigns[_id];
    //we save our campaign in a memory
        require(campaign.creator == msg.sender, "not creator");
//means the campaign creatr is the msg.sender and only him can cancel the campaign
        require(block.timestamp < campaign.startAt, "started");
//means if the campaign has started you cant cancel it
    
 
        delete campaigns[_id];
//deleting campaigns can be done using their unique id, like 001 is deleted
        emit Cancel(_id);
//sending infornations back to the frontend that 001 has been deleted
    }
 
    function pledge(uint _id, uint _amount) external {
//anyone who wants to pledge will need address and amout to pledge
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp >= campaign.startAt, "not started");
// you cant only pledge if the campaign has started if not you cant
        require(block.timestamp <= campaign.endAt, "ended");
//you cant pledge if the campaign has ended
 
        campaign.pledged += _amount;
// adding pledge money to the campaign
        pledgedAmount[_id][msg.sender] += _amount;
// for an amount to be pledged it needs the campaign id , the seder address and amount sent will be added
        token.transferFrom(msg.sender, address(this), _amount);
//means token trasnferFrom the sender address to the campaign address and token sent
 
        emit Pledge(_id, msg.sender, _amount);
//sending pledge to the frontend that someone has paid into the camapign id 001
    }
 
    function unpledge(uint _id, uint _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp <= campaign.endAt, "ended");
//this involves requesting for your money back and not donating again
 
        campaign.pledged -= _amount;
        pledgedAmount[_id][msg.sender] -= _amount;
        token.transfer(msg.sender, _amount);
//this shows the amount/token pledged by the person, and its address
 
        emit Unpledge(_id, msg.sender, _amount);
//sending information to th frontend that someone requesting for its money back and not donating again  

    }
 
    function claim(uint _id) external {
//this function will allow claim your money back
        Campaign storage campaign = campaigns[_id];
        require(campaign.creator == msg.sender, "not creator");
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged >= campaign.goal, "pledged < goal");
        require(!campaign.claimed, "claimed");
 //this shows that truly the amount was added at the time of the campaign and it was claimed
        campaign.claimed = true;
        token.transfer(campaign.creator, campaign.pledged);
 
        emit Claim(_id);
//emitting to the frontend that yes the msg.sender actually sent the money and it was claimed
    }
 
    function refund(uint _id) external {
        Campaign memory campaign = campaigns[_id];
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged < campaign.goal, "pledged >= goal");
 //this shows that truly the money was sent and a refund will be made
        uint bal = pledgedAmount[_id][msg.sender];
        pledgedAmount[_id][msg.sender] = 0;
        token.transfer(msg.sender, bal);
 
        emit Refund(_id, msg.sender, bal);
//emitting to the frontend that a refund has been made
    }
 
}




