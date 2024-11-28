// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Reverium is ERC20, Ownable, ReentrancyGuard {
    uint256 public totalSupply; // Dynamic total supply
    uint256 public constant BURN_RATE = 100; // 1% burn rate (basis points)
    uint256 public constant FEE_RATE = 100; // 1% fee rate (basis points)
    uint256 public constant ANNUAL_BURN_RATE = 25; // 0.25% annual burn rate (basis points)
    address public immutable projectFund;
    uint256 public lastAnnualBurn;

    event TokensBurned(uint256 amount);
    event FeeTransferred(uint256 amount);
    event AnnualBurn(uint256 amount);

    constructor(address projectFundAddress) ERC20("Reverium", "REV") {
        require(projectFundAddress != address(0), "Invalid project fund address");
        uint256 initialSupply = 1_000_000_000 * 10**18; // 1 billion tokens with 18 decimals
        totalSupply = initialSupply;
        _mint(msg.sender, initialSupply); // Mint total supply to deployer
        projectFund = projectFundAddress;
        lastAnnualBurn = block.timestamp;
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal override nonReentrant {
        uint256 burnAmount = (amount * BURN_RATE) / 10000;
        uint256 feeAmount = (amount * FEE_RATE) / 10000;
        uint256 transferAmount = amount - burnAmount - feeAmount;

        require(transferAmount > 0, "Insufficient transfer amount");

        // Update totalSupply for the burned tokens
        totalSupply -= burnAmount;

        super._transfer(sender, address(0), burnAmount); // Burn tokens
        super._transfer(sender, projectFund, feeAmount); // Transfer fee
        super._transfer(sender, recipient, transferAmount); // Transfer remaining tokens

        emit TokensBurned(burnAmount);
        emit FeeTransferred(feeAmount);
    }

    function triggerAnnualBurn() external onlyOwner nonReentrant {
        require(
            block.timestamp >= lastAnnualBurn + 365 days,
            "Annual burn not available yet"
        );

        uint256 burnAmount = (totalSupply * ANNUAL_BURN_RATE) / 10000;
        
        // Update totalSupply for the burned tokens
        totalSupply -= burnAmount;

        _burn(owner(), burnAmount);

        lastAnnualBurn = block.timestamp;
        emit AnnualBurn(burnAmount);
    }
}
