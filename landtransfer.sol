// SPDX-License-Identifier: MIT
pragma solidity ^0.5.11;

contract LandRegistryPropertyTransfer {

    address public contractOwner;

    constructor() public {
        contractOwner = msg.sender;
    } 

    struct Property {
        uint256 id;
        string name;
        string location;
        string owner;
        uint256 price;
    }

    mapping(uint256 => Property) public properties;

    modifier onlyOwner() {
        require(msg.sender == contractOwner);
        _;
    }
    
    function addPropertyDetails(uint256 _id, string memory _name, string memory _location, 
    string memory _owner, uint256 _price) public  onlyOwner {
        properties[_id].id = _id;
        properties[_id].name = _name;
        properties[_id].location = _location;
        properties[_id].owner = _owner;
        properties[_id].price = _price;
    }

    function transferOwnership(uint256 _id, string memory _newOwner) public {
        properties[_id].owner = _newOwner;
    }
    
}
