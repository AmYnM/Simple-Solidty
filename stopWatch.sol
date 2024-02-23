// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract StopWatch {
    
    uint256 start;
    uint256 end;
    
    function Begin() public {
        start = block.timestamp;
        
    }
    
    function Destroy() public {
        end = block.timestamp;
    }
    
    function calc() public view returns (uint256) {
        return end - start;
    }
}