# ColorMarket Smart Contract
ColorMarket is a simple Ethereum smart contract that allows users to buy virtual colors. Each color has a name, a price, and an owner. 

## Features
- Color Struct: Each color has a name, a price, and an owner.
- Colors Array: A dynamic array storing available colors.
- Constructor: Initializes the contract with three predefined colors: Red, Green, and Blue, each with a specified price.
- getColors Function: Allows users to view the list of all available colors.
- buyColor Function: Allows users to purchase a color by sending the required Ether.
- getColorOwner Function: Allows users to view the owner of a specific color.
- withdraw Function: Allows the contract owner to withdraw the balance of the contract.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ColorMarket.sol). Copy and paste the following code into the file:

```solidity
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


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile ColorMarket.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ColorMarket" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it .
## Authors

Ameer S

email-am33rrss@gmail.com

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
