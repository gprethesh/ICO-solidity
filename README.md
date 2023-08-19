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


## Verifying Smart Contracts on Explorers (BscScan, Etherscan)

Verifying your smart contract allows others to see the source code and understand how the contract works. Here's how you can verify your contract:

### Step 1: Deploy the Contract
- Deploy the contract on the desired network (e.g., Ethereum Mainnet, Binance Smart Chain).
- Note the contract address after deployment.

### Step 2: Go to the Explorer
- Navigate to the explorer for the network you deployed on (e.g., [Etherscan](https://etherscan.io/) for Ethereum, [BscScan](https://bscscan.com/) for Binance Smart Chain).

### Step 3: Search for the Contract
- Enter the contract address in the search bar and go to the contract's page.

### Step 4: Click "Verify and Publish"
- Click the "Contract" tab, then click the "Verify and Publish" link.

### Step 4.5: Flatten the Contract Code (if needed)
- Some explorers require the contract code to be flattened (i.e., all dependencies and imports combined into a single file).
- You can flatten the code using the "Solidity Flattener" plugin in Remix.
  1. In Remix, go to the "Plugins" tab and search for "Solidity Flattener."
  2. Click "Activate" to enable the plugin.
  3. Select the contract file you want to flatten.
  4. Click the "Flatten" button in the Solidity Flattener plugin.
  5. The flattened code will be displayed. You can copy this code for verification.

### Step 5: Enter Contract Details (Updated)
- In the explorer's verification page, paste the flattened Solidity code (if required) or the original code.
- Select the compiler version used (e.g., `0.8.0`).
- Fill in the constructor arguments if any were used during deployment.


### Step 6: Verify the Contract
- Click the "Verify and Publish" button.
- If everything is correct, the contract will be verified, and the source code will be visible on the explorer.

## Using ABI Hashex to Obtain Contract Information

Sometimes, you may need to use tools like [ABI Hashex](https://abi.hashex.org/) to obtain the ABI (Application Binary Interface) of the contract.

### Step 1: Go to ABI Hashex
- Navigate to [https://abi.hashex.org/](https://abi.hashex.org/).

### Step 2: Paste the ABI Code
- Copy the ABI code from your contract (available in Remix after compilation).
- Paste the ABI code into the ABI Hashex tool.

### Step 3: Get the Information
- The tool will provide various information related to the contract, such as function signatures and details.

## Conclusion

This project provides a comprehensive solution for token creation, ICO management, and token operations. Follow the above steps to deploy and interact with the contracts using Remix.
