# Project Defi-Empire Metacrafters 

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Deploy Your EVM Subnet](#deploy-your-evm-subnet)
3. [Add Your Subnet to MetaMask](#add-your-subnet-to-metamask)
4. [Connect Remix to MetaMask](#connect-remix-to-metamask)
5. [Deploy Smart Contracts](#deploy-smart-contracts)
6. [Test Your Application](#test-your-application)
7. [Interacting with Deployed Smart Contracts](#interacting-with-deployed-smart-contracts)

## Prerequisites

Before you start, ensure you have the following:

- Avalanche CLI installed
- MetaMask extension installed in your browser
- Basic knowledge of smart contracts and Remix IDE

## Deploy Your EVM Subnet

1. Open your terminal.
2. Run the Avalanche CLI to create and deploy your EVM subnet:

   ```sh
   avalanche subnet create <subnet-name>
   avalanche subnet deploy <subnet-name>
   ```

3. Follow the prompts to configure your subnet and deploy it. Note down the RPC URL provided after deployment.

## Add Your Subnet to MetaMask

1. Open MetaMask.
2. Click on the network dropdown and select **Custom RPC**.
3. Enter the details of your subnet:

   - **Network Name**: <Your Subnet Name>
   - **New RPC URL**: <Your Subnet RPC URL>
   - **Chain ID**: <Your Subnet Chain ID>
   - **Currency Symbol**: <Your Token Symbol> (optional)
   - **Block Explorer URL**: <Your Block Explorer URL> (optional)

4. Click **Save**.

## Connect Remix to MetaMask

1. Open [Remix IDE](https://remix.ethereum.org/).
2. In Remix, click on the **Deploy & Run Transactions** tab on the left sidebar.
3. Under the **ENVIRONMENT** dropdown, select **Injected Provider - MetaMask**.
4. MetaMask will prompt you to connect. Select the account associated with your subnet and click **Connect**.

## Deploy Smart Contracts

1. In Remix, write or upload your smart contracts.
2. Compile the contracts using the **Solidity Compiler** tab.
3. Go back to the **Deploy & Run Transactions** tab.
4. Ensure your contract is selected in the **CONTRACT** dropdown.
5. Click **Deploy**.
6. Confirm the deployment in MetaMask.

## Test Your Application

1. Ensure your MetaMask is connected to your deployed subnet.
2. Interact with your deployed contracts in Remix using the **Deployed Contracts** section.
3. Test various functions to ensure everything works as expected.

## Interacting with Deployed Smart Contracts

1. In Remix, use the **Deployed Contracts** section to interact with your smart contracts.
2. You can deploy tokens, pools, and other components as needed.
3. Monitor and test the interactions to ensure your application behaves correctly.

---

This README file provides a step-by-step guide for deploying and testing your EVM subnet on Avalanche, adding it to MetaMask, connecting Remix, deploying smart contracts, and testing the application. By following these steps, you can ensure a smooth development and testing process for your blockchain application.
