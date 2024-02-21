// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Mapping {
    mapping(address => uint) public balances;

    function update(uint newBalance) public  {
        balances[msg.sender] = newBalance;
    }
}

contract UserMapping {
    function user() public returns (uint) {
        Mapping map = new Mapping();
        map.update(100);
        return map.balances(address(this));      
    }
}
