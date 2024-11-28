# Reverium Token Contracts Documentation

## **Overview**

Reverium is a deflationary and community-focused token ecosystem designed to operate on EVM-compatible blockchains. The smart contracts in this repository provide the foundation for a secure, transparent, and scalable tokenomics model. 

This documentation outlines the features, deployment process, and usage of each contract in the Reverium ecosystem.

---

## **Features**

### 1. **Deflationary Token (REV)**
- Implements ERC-20 standards with deflationary mechanics.
- **Burn Mechanisms:**
  - **1% per transaction:** Automatically burned from each transfer.
  - **0.25% annually:** Reduces the total supply annually.
- **Transfer Fee:**
  - 1% of every transaction is allocated to the project fund.

### 2. **Airdrop Distribution**
- Secure and efficient community reward distribution.
- Batch processing for multiple recipients.
- Adjustable airdrop amounts for dynamic campaigns.

### 3. **Pre-Sale Contract**
- Facilitates token sales with:
  - Adjustable token prices.
  - Per-wallet purchase limits.
  - Secure fund collection in native cryptocurrency.

### 4. **Team & Advisor Vesting**
- Supports a monthly token release schedule for team members and advisors.
- Dynamic beneficiary management:
  - Add new beneficiaries anytime.
  - Automatically tracks claimable tokens based on elapsed months.

---

## **Repository Structure**

```plaintext
reverium-token-contracts/
├── contracts/                   # Smart contract source code
│   ├── Reverium.sol             # Main token contract
│   ├── Airdrop.sol              # Airdrop contract
│   ├── PreSale.sol              # Pre-sale contract
│   ├── TeamVesting.sol          # Vesting contract
├── abi/                         # ABI files for frontend integration
├── scripts/                     # Deployment and verification scripts
│   ├── deploy.js                # Script to deploy all contracts
│   ├── verify.js                # Etherscan verification script
├── test/                        # Unit tests for each contract
│   ├── Reverium.test.js
│   ├── Airdrop.test.js
│   ├── PreSale.test.js
│   ├── TeamVesting.test.js
├── .github/workflows/           # CI/CD automation workflows
│   ├── deploy.yml               # Automatic deployment script
│   ├── test.yml                 # Continuous integration tests
├── .env.example                 # Example for environment variables
├── hardhat.config.js            # Hardhat configuration file
├── package.json                 # Node.js dependencies
├── README.md                    # General project information
├── LICENSE                      # License for the repository
└── SECURITY.md                  # Security guidelines
```

---

## **Technical Specifications**

### **Reverium Token (REV)**
| Feature               | Value                                      |
|-----------------------|--------------------------------------------|
| Total Supply          | 1,000,000,000 REV                         |
| Burn Rate (Transaction) | 1%                                       |
| Annual Burn Rate      | 0.25%                                     |
| Transfer Fee          | 1% (allocated to the project fund)        |
| Standard              | ERC-20                                    |

---

## **Installation**

### **Prerequisites**
Ensure the following tools are installed:
- Node.js and npm/yarn
- MetaMask or any Web3-compatible wallet
- Hardhat (installed via npm)

### **Cloning the Repository**
```bash
git clone https://github.com/yourusername/reverium-token-contracts.git
cd reverium-token-contracts
```

### **Installing Dependencies**
```bash
npm install
```

### **Setting Up Environment Variables**
Create a `.env` file in the root directory based on the `.env.example` file. Add the following variables:
```plaintext
INFURA_API_KEY=your-infura-api-key
PRIVATE_KEY=your-private-key
ETHERSCAN_API_KEY=your-etherscan-api-key
```

---

## **Deployment**

The deployment scripts are located in the `scripts/` directory. Use the following commands to deploy the contracts to your desired network:

### **Deploying Contracts**
1. To deploy on Goerli Testnet:
   ```bash
   npx hardhat run scripts/deploy.js --network goerli
   ```

2. Replace `goerli` with your desired network (e.g., `mainnet`).

### **Verifying Contracts**
To verify the contracts on Etherscan:
```bash
npx hardhat verify --network goerli <contract_address>
```

---

## **Testing**

Run the test suite to verify the functionality of all contracts:
```bash
npx hardhat test
```

All test files are located in the `test/` directory and cover:
- Tokenomics and transfer functionality.
- Airdrop processing.
- Pre-sale mechanics.
- Vesting and claim tracking.

---

## **Usage**

### **Interacting with Smart Contracts**
Once deployed, you can interact with the contracts via:
- **Ethers.js or Web3.js:** For programmatic integration.
- **Remix IDE:** For manual testing and calls.
- **Frontend Interface:** Using the provided ABI files.

### **Key Contract Functions**

#### **Reverium Token**
- `transfer(address recipient, uint256 amount)`: Transfer tokens to another address.
- `triggerAnnualBurn()`: Initiate the annual burn process.

#### **Airdrop Contract**
- `distributeAirdrop(address[] recipients)`: Distribute tokens to multiple addresses.

#### **Pre-Sale Contract**
- `buyTokens(uint256 amount)`: Purchase tokens during the pre-sale.

#### **Team Vesting Contract**
- `claimTokens()`: Claim vested tokens for a beneficiary.

---

## **Contributing**

We welcome contributions to the Reverium Token Contracts repository. To contribute:
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes and submit a pull request.

Please review our `CONTRIBUTING.md` file for detailed guidelines.

---

## **Security**

This repository follows best practices for smart contract security. Key highlights:
- **OpenZeppelin Standards:** Used for ERC-20, Ownable, and ReentrancyGuard implementations.
- **Code Reviews:** All contributions are reviewed before merging.
- **Audits:** Contracts undergo independent security audits.

Refer to `SECURITY.md` for more information.

---

## **License**

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## **Contact**

For inquiries, bug reports, or feature requests, please reach out via:
- **Email:** security@reveriumproject.com
- **GitHub Issues:** [Issues Page](https://github.com/yourusername/reverium-token-contracts/issues)
