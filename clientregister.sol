// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Business {
    struct Client {
        address clientAddress;
        string name;
        uint256 registrationDate;
    }

    mapping(address => Client) public clients;

    event ClientRegistered(address indexed clientAddress, string name, uint256 registrationDate);

    function registerClient(string memory _name) public {
        require(bytes(_name).length > 0, "Name must not be empty");
        require(clients[msg.sender].clientAddress == address(0), "Client already registered");

        clients[msg.sender] = Client(msg.sender, _name, block.timestamp);
        emit ClientRegistered(msg.sender, _name, block.timestamp);
    }

    function getClient(address _clientAddress) public view returns (address, string memory, uint256) {
        Client memory client = clients[_clientAddress];
        return (client.clientAddress, client.name, client.registrationDate);
    }
}
