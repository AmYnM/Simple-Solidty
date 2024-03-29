// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicBetting  {
    address public owner;
    mapping (address => uint256) public bets;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function placeBet(uint256 amount) external payable {
        require(amount > 0, "Bet amount should be greater than 0");
        require(msg.value == amount, "Sent value should be equal to bet amount");

        bets[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdraw amount should be greater than 0");
        require(amount <= bets[msg.sender], "Insufficient Balance");

        bets[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function contractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function ownerWithdraw(uint256 amount) external onlyOwner {
        require(amount <= address(this).balance, "Insufficient contract balance");
        payable(owner).transfer(amount);
    }
}