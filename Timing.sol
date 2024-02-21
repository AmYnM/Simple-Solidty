// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
contract SampleTiming {
    uint public deploymentTime;

    constructor() {
        // deploymentTime = now; // now is a keyword
        deploymentTime = block.timestamp;
    }
    function getDeploymentTime() public view returns(uint) {
        return deploymentTime;
    }
}