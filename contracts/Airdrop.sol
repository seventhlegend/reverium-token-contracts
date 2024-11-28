// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Airdrop is Ownable, ReentrancyGuard {
    IERC20 public immutable token;
    uint256 public immutable airdropAmount;

    event AirdropDistributed(address indexed recipient, uint256 amount);

    constructor(IERC20 tokenAddress, uint256 amount) {
        require(address(tokenAddress) != address(0), "Invalid token address");
        token = tokenAddress;
        airdropAmount = amount;
    }

    function distributeAirdrop(address[] calldata recipients) external onlyOwner nonReentrant {
        uint256 totalAmount = recipients.length * airdropAmount;
        require(token.balanceOf(address(this)) >= totalAmount, "Insufficient token balance");

        for (uint256 i = 0; i < recipients.length; i++) {
            require(recipients[i] != address(0), "Invalid recipient");
            token.transfer(recipients[i], airdropAmount);
            emit AirdropDistributed(recipients[i], airdropAmount);
        }
    }
}
