# Solidity-Pragramming-Smart-Contracts-
# ERC-20 Token Contract

This Solidity smart contract is an implementation of an ERC-20 token, which adheres to the widely accepted Ethereum token standard. ERC-20 tokens are fungible tokens that can be used for various purposes such as digital currencies, rewards, and access to services.

## Contract Overview

### State Variables
- `address Owner`: Stores the address of the contract owner.
- `string CoinName`: Represents the name of the token.
- `string Symboll`: Represents the symbol or ticker of the token.
- `uint public TotalSupply`: Indicates the total supply of the token.
- `uint public RemainingSupply`: Tracks the remaining supply of the token.
- `mapping (address => uint) public BalanceOf`: Maps Ethereum addresses to their token balances.
- `mapping (address => mapping(address => uint)) public Allowancee`: Maps Ethereum addresses to allowances for spending tokens on behalf of other addresses.

### Modifiers
- `modifier OnlyAdmin()`: Ensures that a function can only be called by the contract owner (admin).

### Constructor
- The constructor initializes the contract with the token's name, total supply, and symbol. It sets the contract owner to the deployer and assigns the total supply to the owner's balance.

### Functions

#### `Balance_of(address _spender) public view returns(uint)`
- Allows users to check the token balance of a specific address.

#### `Totalsupply() public view returns(uint)`
- Returns the total supply of the token.

#### `TransferTo(address _receipt, uint _Amount) public returns(bool)`
- Enables users to transfer tokens to another address.
- Checks if the sender has a sufficient balance.
- Updates the remaining supply, sender's and recipient's balances.

#### `TransferFrom(address _spender, address _receipt, uint _amount) public`
- Allows spending tokens on behalf of another address if allowed.
- Checks if the spender has enough allowance.
- Updates allowances and balances accordingly.

#### `Allowance(address _owner,address _spender) public view returns(uint)`
- Allows users to check the amount of tokens that a spender is allowed to transfer on behalf of an owner.

#### `Approve(address _spender,uint _amount) public`
- Allows users to grant allowance for spending tokens on their behalf.
- Checks if the sender has a sufficient balance.

## Getting Started

1. Deploy the smart contract on the Ethereum blockchain.
2. Interact with the contract using a compatible Ethereum wallet or through a decentralized application (DApp).
3. The contract owner can configure the initial token supply, and users can transfer tokens and manage allowances.

## Considerations

- This contract provides basic ERC-20 token functionality. You may want to add additional features like token burning, pausing, or upgrading mechanisms.
- Ensure that the contract is secure and follows best practices before deploying it on the blockchain.
- Conduct thorough testing to verify the contract's functionality and security.
- Keep the contract's state variables and functions in mind when designing a user interface or integrating it into a DApp.

## License

This ERC-20 token contract is released under the MIT License. See the SPDX-License-Identifier at the top of the contract file for details.
