// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// BurguerBomb (BGB) ERC-20 token with burn on each transfer
contract BurguerBombToken is ERC20, Ownable {
    uint256 public constant INITIAL_SUPPLY = 1_000_000_000 * 10 ** 18;
    uint8 private constant BURN_PERCENT = 1; // 1% burn
    mapping(address => bool) public isExcludedFromBurn;

    constructor() ERC20("BurguerBomb", "BGB") {
        _mint(msg.sender, INITIAL_SUPPLY);
        isExcludedFromBurn[msg.sender] = true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        if (isExcludedFromBurn[sender] || isExcludedFromBurn[recipient]) {
            super._transfer(sender, recipient, amount);
        } else {
            uint256 burnAmount = (amount * BURN_PERCENT) / 100;
            uint256 sendAmount = amount - burnAmount;
            super._burn(sender, burnAmount);
            super._transfer(sender, recipient, sendAmount);
        }
    }

    function excludeFromBurn(address account, bool excluded) external onlyOwner {
        isExcludedFromBurn[account] = excluded;
    }
}