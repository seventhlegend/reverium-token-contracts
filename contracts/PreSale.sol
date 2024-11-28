// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract PreSale is Ownable, ReentrancyGuard {
    IERC20 public immutable token;
    uint256 public immutable tokenPrice;
    uint256 public immutable maxPurchaseLimit;

    uint256 public totalSold;
    mapping(address => uint256) public purchases;

    event TokensPurchased(address indexed buyer, uint256 amount);

    constructor(
        IERC20 tokenAddress,
        uint256 price,
        uint256 maxPurchase
    ) {
        require(address(tokenAddress) != address(0), "Invalid token address");
        token = tokenAddress;
        tokenPrice = price;
        maxPurchaseLimit = maxPurchase;
    }

    function buyTokens(uint256 amount) external payable nonReentrant {
        require(msg.value == amount * tokenPrice, "Incorrect payment amount");
        require(purchases[msg.sender] + amount <= maxPurchaseLimit, "Exceeds max purchase limit");
        require(token.balanceOf(address(this)) >= amount, "Insufficient tokens");

        purchases[msg.sender] += amount;
        totalSold += amount;
        token.transfer(msg.sender, amount);

        emit TokensPurchased(msg.sender, amount);
    }
}
