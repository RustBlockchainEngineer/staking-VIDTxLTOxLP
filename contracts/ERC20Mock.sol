// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";

// mock class using ERC20
contract ERC20Mock is ERC20, ERC20Burnable {
    constructor (
        string memory name,
        string memory symbol,
        uint8 decimals,        
        uint256 initialBalance
    ) public payable ERC20(name, symbol) {
        _setupDecimals(decimals);
        _mint(msg.sender, initialBalance);
    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    function transferInternal(address from, address to, uint256 value) public {
        _transfer(from, to, value);
    }

    function approveInternal(address owner, address spender, uint256 value) public {
        _approve(owner, spender, value);
    }
}
