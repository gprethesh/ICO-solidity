// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract USDT is ERC20 {
    constructor(uint256 initialSupply) ERC20("USDT", "USDT") {
        _mint(msg.sender, initialSupply);
    }

    function transferHumanReadable(address recipient, uint256 amount) public returns (bool) {
        uint256 amountInBaseUnits = amount * (10 ** decimals());
        return super.transfer(recipient, amountInBaseUnits);
    }
}

