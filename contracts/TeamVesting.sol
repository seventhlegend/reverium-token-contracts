// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract TeamVesting is Ownable, ReentrancyGuard {
    IERC20 public immutable token;
    uint256 public immutable monthlyRelease;

    struct Beneficiary {
        uint256 totalAllocation;
        uint256 claimed;
        uint256 startDate;
    }

    mapping(address => Beneficiary) public beneficiaries;

    event BeneficiaryAdded(address indexed beneficiary, uint256 allocation);
    event TokensClaimed(address indexed beneficiary, uint256 amount);

    constructor(IERC20 tokenAddress, uint256 releaseAmount) {
        require(address(tokenAddress) != address(0), "Invalid token address");
        token = tokenAddress;
        monthlyRelease = releaseAmount;
    }

    function addBeneficiary(address beneficiary, uint256 allocation) external onlyOwner {
        require(beneficiary != address(0), "Invalid beneficiary address");
        require(allocation > 0, "Allocation must be greater than 0");
        require(beneficiaries[beneficiary].totalAllocation == 0, "Beneficiary already exists");

        beneficiaries[beneficiary] = Beneficiary({
            totalAllocation: allocation,
            claimed: 0,
            startDate: block.timestamp
        });

        emit BeneficiaryAdded(beneficiary, allocation);
    }

    function claimTokens() external nonReentrant {
        Beneficiary storage beneficiary = beneficiaries[msg.sender];
        require(beneficiary.totalAllocation > 0, "Not a beneficiary");

        uint256 monthsElapsed = (block.timestamp - beneficiary.startDate) / 30 days;
        uint256 totalClaimable = monthsElapsed * monthlyRelease;

        require(totalClaimable > beneficiary.claimed, "No tokens available to claim");

        uint256 amountToClaim = totalClaimable - beneficiary.claimed;
        require(amountToClaim <= token.balanceOf(address(this)), "Insufficient token balance");

        beneficiary.claimed += amountToClaim;
        token.transfer(msg.sender, amountToClaim);

        emit TokensClaimed(msg.sender, amountToClaim);
    }
}
