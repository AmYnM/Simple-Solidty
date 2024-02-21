// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract EmployeeRegistry {

    struct Employee {
    uint256 id;
    string name;
    uint256 age;
    string department;
    }

    // Mapping the key => value
    mapping (uint256 => Employee) public employees; 

    // Add new employee
    function addEmployee(uint256 id, string memory name, uint256 age, string memory department) public {
        //create a new object to add new employee
        Employee memory newEmployee = Employee(id, name, age, department);
        // store the memory in mapping
        employees[id] = newEmployee;
    }

    // Get the employee details
    function getEmployee(uint256 id) public view returns (uint256, string memory, uint256, string memory) {
        // Retreive the employee details
        Employee memory retrievedEmployee = employees[id];
        return (retrievedEmployee.id, retrievedEmployee.name, retrievedEmployee.age, retrievedEmployee.department);
    }
}