// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract TS is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("tether Swap", "TS") Ownable(msg.sender) {
        _mint(_msgSender(), initialSupply);
    }

    function transferHumanReadable(address recipient, uint256 amount) public returns (bool) {
        require(recipient != address(0), "Transfer to the zero address not allowed");
        uint256 amountInBaseUnits = amount * (10 ** decimals());
        require(amountInBaseUnits <= balanceOf(msg.sender), "Insufficient balance");
        return super.transfer(recipient, amountInBaseUnits);
    }

    function burnFrom(address account, uint256 amount) public virtual onlyOwner {
        require(account != address(0), "Burn from the zero address not allowed");
        uint256 currentAllowance = allowance(account, _msgSender());
        require(currentAllowance >= amount, "ERC20: burn amount exceeds allowance");
        _approve(account, _msgSender(), currentAllowance - amount);
        _burn(account, amount);
    }

    function burn(uint256 amount) public virtual {
        require(amount <= balanceOf(msg.sender), "Burn amount exceeds balance");
        _burn(_msgSender(), amount);
    }
}

