//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
 //import "@openzeppelin/contracts/utils/math/SafeMath.sol";

interface IERC20 {
    
    function totalSupply() external  view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function confirm(address allocate, uint256 value) external returns (bool);
    event Transfer(address indexed  from, address indexed to, uint256 value);
    event Confirm(address indexed from, address indexed allocate, uint256 value);
}
// Safe Math Library
// ----------------------------------------------------------------------------
// contract SafeMath {
// function safeAdd(uint a, uint b) public pure returns (uint c) {
// c = a + b;
// require(c >= a);
// }
// function safeSub(uint a, uint b) public pure returns (uint c) {
// require(b <= a);
// c = a - b;
// }
// }

contract Erc20Sam is IERC20 {
    string public name;
    string public brand;
    uint256 public decimals;
    uint256 totalsupply;
    
    mapping(address=>uint256) balanceOf;
    mapping(address=>mapping(address=>uint256)) allowance;
    
    
    constructor() {
        name = "Edifice";
        brand = "Casio";
        decimals = 10;
        totalsupply = 100 ** uint256(decimals);
        balanceOf[msg.sender] = totalsupply;
    }
    
    
    function totalsupplyer() public view returns (uint256) {
        return totalsupply;
    }
    
    // function balanceOf(address account) public view returns (uint256) {
    //     return balanceOf[account];
    // }
    
    function transfer(address from, address to, uint256 value) public returns (bool) {
        require(to != address(0),"Balance is zero");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender,to, value );
        return true;
        
        
    }
    
    function confirm(address allocate, uint256 value) public returns (bool) {
        allowance[msg.sender][allocate] = value;
        emit Confirm(msg.sender,allocate,value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        balanceOf[from] -= value;
        allowance[msg.sender][from] -= value;
        balanceOf[to] += value;
        return true;
    
}

// function allowance(address from, address allocate) public view returns (uint256) {
//     return allowance[from][allocate];
// }
}
