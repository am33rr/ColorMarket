// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ColorMarket {
    struct Color {
        string name;
        uint256 price;
        address owner;
    }

    Color[] public colors;


    constructor() {
        colors.push(Color("Red", 1 ether, address(0)));
        colors.push(Color("Green", 2 ether, address(0)));
        colors.push(Color("Blue", 3 ether, address(0)));
    }

    function getColors() public view returns (Color[] memory) {
        return colors;
    }

    function buyColor(uint256 index) public payable {
        require(index < colors.length, "Color index out of bounds.");
        Color storage color = colors[index];
        assert(msg.value >= color.price);
        if(color.owner != address(0)){
            revert("Color already sold.");
        } 
        color.owner = msg.sender;

    }

    function getColorOwner(uint256 index) public view returns (address) {
        require(index < colors.length, "Color index out of bounds.");
        return colors[index].owner;
    }

    function withdraw() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}
