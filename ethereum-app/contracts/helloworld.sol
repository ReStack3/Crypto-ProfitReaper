// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "hardhat/console.sol"; // Hardhat 提供的 console

contract HelloWorld {
    string public message;

    constructor() {
        message = "Hello World";
        console.log("Contract deployed! Message:", message);
    }

    function sayHello() public view returns (string memory) {
        console.log("sayHello called! Message:", message);
        return message;
    }
}
