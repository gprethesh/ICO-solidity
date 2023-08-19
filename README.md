# ICO Solidity Project

This project consists of Solidity contracts for creating and managing tokens and an ICO (Initial Coin Offering). Below are the details of the files and instructions on how to use and deploy them.

## Files

### 1. `USDT_test_token.sol`
- **Contract Name:** USDT
- **Description:** Defines a USDT token contract that extends the ERC20 standard.
- **Functions:** Minting, transferring tokens in human-readable format.

### 2. `crowd.sol`
- **Contract Name:** ICOCrowdsale
- **Description:** Manages an ICO with functionalities for buying tokens, referral rewards, and withdrawals.
- **Functions:** Buying tokens, checking and claiming referral rewards, withdrawing funds.

### 3. `native_token.sol`
- **Contract Name:** TS (Tether Swap)
- **Description:** Defines a token contract with functionalities for transferring and burning tokens.
- **Functions:** Transferring tokens in human-readable format, burning tokens.

## How to Use and Deploy

### Step 1: Open Remix IDE
- Go to [Remix IDE](https://remix.ethereum.org/).
- Create a new Solidity file for each contract.

### Step 2: Copy and Paste the Code
- Copy the content of each `.sol` file from the repository and paste it into the corresponding file in Remix.

### Step 3: Select Compiler Version
- In the "Solidity Compiler" tab, select the compiler version `0.8.0` to match the pragma version used in the code.

### Step 4: Compile the Contracts
- Click the "Compile" button for each contract.

### Step 5: Deploy the Contracts
- In the "Deploy & Run Transactions" tab, select the environment (e.g., JavaScript VM, Injected Web3).
- Select the contract you want to deploy and fill in any required constructor parameters.
- Click the "Deploy" button.

### Step 6: Interact with the Contracts
- Use the deployed contract interface in Remix to call functions and interact with the contract.

## Conclusion

This project provides a comprehensive solution for token creation, ICO management, and token operations. Follow the above steps to deploy and interact with the contracts using Remix.
