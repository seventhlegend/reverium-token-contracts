# Reverium Token Contracts

Reverium is a deflationary token ecosystem built on EVM-compatible blockchains. This repository contains the smart contracts for the core token, airdrop, pre-sale, and team/advisor vesting mechanisms.

## Features

- **Deflationary Token (REV):** Includes transaction-based burn (1%) and annual burn (0.25%).
- **Airdrop Contract:** Secure and dynamic token distribution for community incentives.
- **Pre-Sale Contract:** Handles token sales with purchase limits and secure transactions.
- **Team Vesting Contract:** Implements a dynamic vesting schedule for team members and advisors.

## Repository Structure

```plaintext
reverium-token-contracts/
├── contracts/                   # Smart contracts source code
│   ├── Reverium.sol             # Main token contract
│   ├── Airdrop.sol              # Airdrop distribution contract
│   ├── PreSale.sol              # Token pre-sale contract
│   ├── TeamVesting.sol          # Team/advisor vesting contract
├── abi/                         # ABI files for frontend integration
├── scripts/                     # Deployment and verification scripts
│   ├── deploy.js
│   ├── verify.js
├── test/                        # Unit tests for all contracts
│   ├── Reverium.test.js
│   ├── Airdrop.test.js
│   ├── PreSale.test.js
│   ├── TeamVesting.test.js
├── .github/workflows/           # GitHub Actions for CI/CD
│   ├── test.yml                 # Automated testing workflow
│   ├── deploy.yml               # Deployment workflow
├── .env.example                 # Environment variable example
├── LICENSE                      # License information
├── README.md                    # Project documentation
├── hardhat.config.js            # Hardhat configuration
├── package.json                 # Node.js dependencies
└── SECURITY.md                  # Security best practices
```

---

## Installation and Setup

### Prerequisites

- Node.js and npm/yarn
- MetaMask or any Web3-compatible wallet
- Hardhat (installed via npm)

### Clone the Repository

```bash
git clone https://github.com/yourusername/reverium-token-contracts.git
cd reverium-token-contracts
```

### Install Dependencies

```bash
npm install
```

### Environment Variables

Create a `.env` file in the root directory based on `.env.example`:

```plaintext
INFURA_API_KEY=your-infura-api-key
PRIVATE_KEY=your-private-key
ETHERSCAN_API_KEY=your-etherscan-api-key
```

---

## Deployment

To deploy the contracts, use the `deploy.js` script located in the `scripts` folder. Make sure your wallet is funded on the target network.

### Example Deployment

```bash
npx hardhat run scripts/deploy.js --network goerli
```

Replace `goerli` with the desired network.

---

## Testing

Run the test suite to ensure the contracts function as expected:

```bash
npx hardhat test
```

All unit tests are located in the `test` folder.

---

## Contracts Overview

### **Reverium.sol**
- Implements the core token functionality (ERC-20 standard).
- Features:
  - Fixed supply (1 billion tokens).
  - Burn mechanism (1% per transaction).
  - Annual burn (0.25% of total supply).
  - Transfer fee (1% sent to project fund).

### **Airdrop.sol**
- Distributes tokens to community members.
- Key Features:
  - Dynamically set airdrop amount.
  - Supports batch distribution.

### **PreSale.sol**
- Facilitates token sales before public launch.
- Key Features:
  - Adjustable token price.
  - Purchase limits per wallet.
  - Funds collection in native cryptocurrency (e.g., ETH).

### **TeamVesting.sol**
- Manages token vesting for team members and advisors.
- Key Features:
  - Monthly release schedule.
  - Dynamic addition of beneficiaries.
  - Claim tracking.

---

## Security Considerations

- Follows OpenZeppelin standards for secure smart contract development.
- Protected against reentrancy attacks using `nonReentrant`.
- Contracts are optimized to minimize gas costs.

Refer to `SECURITY.md` for additional details.

---

## Contributing

We welcome contributions from the community! Follow these steps to get started:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes and open a pull request.

See `CONTRIBUTING.md` for more details.

---

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## Contact

For questions or feedback, please reach out via the [Issues](https://github.com/yourusername/reverium-token-contracts/issues) section of this repository.
