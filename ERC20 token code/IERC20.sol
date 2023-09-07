// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


//Owner => Who decide total number of Token
//Sender => who have token to spend
//reciepient => who recieve Token

interface IERC20 {
    function BalanceOf(address _spender) external view returns(uint);
    function TotalSupply() external view returns(uint);
    function TransferTo(address _receipt, uint _Amount) external returns(bool);
    function TransferFrom(address _spender, address receipt, uint _amount) external;
    function Allowance(address _owner,address _spender) external returns(uint);
    function Approve(address _spender,uint _amount) external;  
}