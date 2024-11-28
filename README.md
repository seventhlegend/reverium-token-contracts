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

## **Token Economics (Tokenomics)**

Reverium (REV) is designed with a deflationary and sustainable tokenomics model to balance utility, incentivize holders, and ensure long-term growth for the ecosystem. Below are the key details:

---

### **1. Token Supply**

| **Metric**          | **Value**                  |
|---------------------|---------------------------|
| **Total Supply**    | 1,000,000,000 REV         |
| **Decimals**        | 18                        |
| **Blockchain**      | EVM-Compatible Chains     |
| **Standard**        | ERC-20                    |

The total supply of REV is fixed at **1 billion tokens** and cannot be increased due to the absence of minting functionality. This ensures a predictable and transparent supply.

---

### **2. Token Allocation**

| **Category**          | **Percentage** | **Amount (REV)**         | **Details**                                                                                  |
|-----------------------|----------------|--------------------------|---------------------------------------------------------------------------------------------|
| **Pre-Sale**          | 10%            | 100,000,000 REV          | Available for purchase during the pre-sale phase.                                           |
| **Team & Advisors**   | 10%            | 100,000,000 REV          | Vesting over 12 months; monthly claims.                                                     |
| **Community Rewards** | 20%            | 200,000,000 REV          | Reserved for airdrops, staking rewards, and community incentives.                           |
| **Ecosystem Fund**    | 15%            | 150,000,000 REV          | For partnerships, development, and strategic growth.                                        |
| **Liquidity Pool**    | 30%            | 300,000,000 REV          | To ensure seamless trading on decentralized exchanges (DEXs).                               |
| **DAO Treasury**      | 15%            | 150,000,000 REV          | Managed by the decentralized autonomous organization (DAO) after governance activation.     |

---

### **3. Deflationary Mechanisms**

Reverium employs two key deflationary mechanisms to reduce supply over time and increase scarcity:

#### **1. Transaction Burn (1%)**
- **Mechanism:** 1% of each transaction amount is burned.
- **Impact:** Directly reduces circulating supply with every transfer, increasing token value over time.

#### **2. Annual Burn (0.25%)**
- **Mechanism:** 0.25% of the total supply is burned annually, triggered by the project owner or DAO.
- **Impact:** Ensures consistent deflation, creating long-term value for holders.

**Example:**  
For every **100 REV** transferred:
- **1 REV** is burned.
- **Remaining 99 REV** is distributed as per the transaction structure.

---

### **4. Transfer Fee (1%)**

| **Destination**         | **Percentage** | **Purpose**                               |
|-------------------------|----------------|-------------------------------------------|
| **Project Fund**        | 1%             | Supports development and ecosystem growth.|

The transfer fee mechanism allocates 1% of each transaction to the project fund. These funds are used for development, marketing, and operational expenses.

---

### **5. Token Vesting (Team & Advisors)**

| **Beneficiaries**         | **Allocation**   | **Vesting Period** | **Monthly Release**  |
|---------------------------|------------------|---------------------|-----------------------|
| Team & Advisors           | 10% (100M REV)  | 12 months           | ~8.33M REV per month |

#### **Vesting Details**
1. Tokens are locked upon deployment and released monthly over a 12-month schedule.
2. Team members and advisors can claim tokens through the vesting contract after each vesting period.
3. Additional team members can be added dynamically, and allocations are tracked individually.

---

### **6. Pre-Sale Details**

| **Metric**             | **Value**                  |
|------------------------|---------------------------|
| **Allocation**         | 10% (100M REV)            |
| **Token Price**        | Adjustable (e.g., 0.001 ETH per REV) |
| **Purchase Limit**     | Per-wallet limit applies (e.g., 10,000 REV) |
| **Funds Accepted**     | ETH (or chain-native cryptocurrency) |

#### **Pre-Sale Phases**
1. **Phase 1: Whitelist Access**
   - Priority given to community members and early supporters.
2. **Phase 2: Public Sale**
   - Remaining tokens are available to the public.

---

### **7. Community Rewards**

- **Allocation:** 20% (200M REV).
- **Purpose:** Incentivize participation, reward community contributions, and support staking pools.
- **Examples of Use Cases:**
  - Airdrops to early adopters and active participants.
  - Liquidity mining rewards for DEX pools.
  - Engagement rewards for governance participation.

---

### **8. DAO Treasury**

- **Allocation:** 15% (150M REV).
- **Purpose:** Controlled by the DAO to fund future ecosystem initiatives, grants, and partnerships.
- **Activation:** DAO governance will be activated within 6-12 months post-launch, transferring treasury control to the community.

---

### **9. Liquidity Pool**

- **Allocation:** 30% (300M REV).
- **Purpose:** Ensure liquidity on decentralized exchanges to enable seamless trading.
- **Use Cases:**
  - Initial liquidity provision on platforms like Uniswap or PancakeSwap.
  - Liquidity incentives for early adopters.

---

### **10. Governance Transition**

| **Stage**                  | **Timeline**            | **Details**                                                                 |
|----------------------------|-------------------------|------------------------------------------------------------------------------|
| **Initial Ownership**      | 0-12 months            | Managed by the project team for security and development.                   |
| **DAO Activation**         | 6-12 months            | DAO treasury control and governance mechanisms will be fully operational.   |

---

### **11. Key Benefits**

- **Deflationary Model:** Reduces circulating supply over time.
- **Community-Centric:** Rewards for contributors and active participants.
- **Transparency:** Pre-defined allocation and mechanisms ensure trust.
- **Scalability:** Designed for EVM-compatible chains to ensure interoperability.

---

### **Visual Token Allocation**

```plaintext
Pre-Sale          [███████---] 10%
Team & Advisors   [███████---] 10%
Community Rewards [███████████] 20%
Ecosystem Fund    [██████-----] 15%
Liquidity Pool    [███████████] 30%
DAO Treasury      [██████-----] 15%
```

---

### **Economic Impact**

1. **Scarcity Through Burns:**
   - Every transaction reduces the circulating supply, creating upward price pressure.
2. **Sustainable Rewards:**
   - Community rewards and staking incentives are sourced responsibly.
3. **Treasury for Growth:**
   - DAO-managed funds ensure long-term ecosystem development.

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
