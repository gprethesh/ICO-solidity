// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ICOCrowdsale {
    address payable public owner;
    IERC20 public tokenContract;
    IERC20 public cusdtContract;
    
    uint256 public tokenPrice;
    uint256 public minPurchase;
    uint256 public maxPurchase;
    uint256 public totalClaimed;

    mapping(address => uint256) public referralRewards;

    event TokensPurchased(address indexed purchaser, uint256 amount, address indexed referrer);

    constructor(
        address tokenContractAddress, 
        address cusdtContractAddress, 
        uint256 _tokenPrice, 
        uint256 _minPurchase, 
        uint256 _maxPurchase
    ) {
        owner = payable(msg.sender);
        tokenContract = IERC20(tokenContractAddress);
        cusdtContract = IERC20(cusdtContractAddress);
        tokenPrice = _tokenPrice;
        minPurchase = _minPurchase;
        maxPurchase = _maxPurchase;
    }

    receive() external payable {
        revert("Direct payment not accepted");
    }

    function buyTokens(uint256 cusdtAmount, address referrer) public {
        require(cusdtAmount >= minPurchase, "USDT amount less than minimum purchase limit");
        require(cusdtAmount <= maxPurchase, "USDT amount exceeds maximum purchase limit");
        require(cusdtAmount % tokenPrice == 0, "Cannot purchase fractional tokens");

        // Check allowance
        uint256 allowed = cusdtContract.allowance(msg.sender, address(this));
        require(allowed >= cusdtAmount, "Must approve contract to spend USDT token first");
        
        uint256 tokenAmount = cusdtAmount * 10**18 / tokenPrice;

        require(tokenContract.balanceOf(address(this)) >= tokenAmount, "Not enough tokens in contract");

        // Transfer CUSDT from buyer to this contract
        cusdtContract.transferFrom(msg.sender, address(this), cusdtAmount);
        
        // Transfer tokens from this contract to buyer
        tokenContract.transfer(msg.sender, tokenAmount);
        
        // Calculate referral reward (10% of tokens bought)
        uint256 referralReward = tokenAmount / 10;
        // Update the referral reward balance
        referralRewards[referrer] += referralReward;

        emit TokensPurchased(msg.sender, tokenAmount, referrer);
    }

        function checkReferralRewards() public view returns(uint256) {
        return referralRewards[msg.sender];
    }


    function claimRewards() public {
        uint256 reward = referralRewards[msg.sender];
        require(reward > 0, "No referral rewards to claim");

        require(tokenContract.balanceOf(address(this)) >= reward, "Not enough tokens in contract");
        tokenContract.transfer(msg.sender, reward);

        // Update totalClaimed
        totalClaimed += reward;

        referralRewards[msg.sender] = 0;
    }


    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 balance = cusdtContract.balanceOf(address(this));
        cusdtContract.transfer(owner, balance);
    }
    
    function withdrawCusdt(uint256 amountInEther) public {
        require(msg.sender == owner, "Only owner can withdraw USDT");
        
        uint256 amountInWei = amountInEther * 10**18; // convert from ether to wei
        
        require(cusdtContract.balanceOf(address(this)) >= amountInWei, "Not enough USDT in contract");
        
        cusdtContract.transfer(owner, amountInWei);
    }

    
    function withdrawTokens() public {
        require(msg.sender == owner, "Only owner can withdraw tokens");
        uint256 balance = tokenContract.balanceOf(address(this));
        tokenContract.transfer(owner, balance);
    }
}

