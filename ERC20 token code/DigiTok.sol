// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./IERC20.sol";

contract Token is  IERC20
{
    address Owner;
    string CoinName;
    string Symboll;
    uint public TotalSupply;
    uint public RemainingSupply;
    mapping (address=>uint) public  BalanceOf;
    mapping (address=>mapping(address=>uint)) public Allowancee;

    modifier OnlyAdmin()
    {
        require(msg.sender==Owner, "You are not contract Owner");
        _;
    }

    constructor(string memory _CoinName,uint _TotalSupply,string memory _symboll)
    {
        CoinName=_CoinName;
        TotalSupply=_TotalSupply;
        Symboll=_symboll;
        Owner=msg.sender;
        RemainingSupply=_TotalSupply;
        BalanceOf[Owner]=RemainingSupply;
    }

    function Balance_of(address _spender) public view returns(uint)
    {
        return BalanceOf[_spender];
    }
    function Totalsupply() public view returns(uint)
    {
        return TotalSupply;
    }
    function TransferTo(address _receipt, uint _Amount) public returns(bool)
    {   
        // require(RemainingSupply>0, "No Token Left");
        require(BalanceOf[msg.sender]>=_Amount, "You Dont Have Enough Token");
        RemainingSupply-=_Amount;
        BalanceOf[_receipt]+=_Amount;
        BalanceOf[Owner]=RemainingSupply;
        return true;
    }
    function TransferFrom(address _spender, address _receipt, uint _amount) public
    {
        require(Allowancee[_spender][msg.sender]>=_amount,"you don't have enough token allocated to send");
        Allowancee[_spender][msg.sender]-=_amount;
        RemainingSupply-=_amount;
        BalanceOf[Owner]=RemainingSupply;
        BalanceOf[_receipt]+=_amount;
    }

    function Allowance(address _owner,address _spender) public view returns(uint)
    {
        return Allowancee[_owner][_spender];
    }

    function Approve(address _spender,uint _amount) public
    {
        require(BalanceOf[msg.sender]>=_amount, "You dont have enough token to allow");
        Allowancee[msg.sender][_spender]+=_amount;
    } 

}