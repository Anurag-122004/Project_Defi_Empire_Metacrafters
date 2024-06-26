// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract Vault {
    IERC20 public immutable token;
    address public gameToken;
    uint public totalSupply;
    mapping(address => uint) public balanceOf;

    event Deposited(address indexed user, uint amount, uint shares);
    event Withdrawn(address indexed user, uint shares, uint amount);

    constructor(address _token1, address _GameToken) {
        token = IERC20(_token1);
        gameToken = _GameToken;
    }

    function _safeTransferFrom(address sender, uint amount) private {
        bool success = token.transferFrom(sender, address(this), amount);
        require(success, "Transfer failed");
    }

    function _safeTransfer(address recipient, uint amount) private {
        bool success = token.transfer(recipient, amount);
        require(success, "Transfer failed");
    }

    function _mint(address _to, uint _shares) private {
        totalSupply += _shares;
        balanceOf[_to] += _shares;
    }

    function _burn(address _from, uint _shares) private {
        totalSupply -= _shares;
        balanceOf[_from] -= _shares;
    }

    function vault_burn(address _from, uint _shares) external {
        _burn(_from, _shares);
    }

    function deposit(uint _amount) external {
        require(_amount > 0, "Invalid amount");

        uint currentBalance = token.balanceOf(address(this));
        uint shares = totalSupply == 0 ? _amount : (_amount * totalSupply) / currentBalance;

        _mint(msg.sender, shares);
        _safeTransferFrom(msg.sender, _amount);

        emit Deposited(msg.sender, _amount, shares);
    }

    function withdraw(uint _shares) external {
        require(_shares > 0, "Invalid shares");

        uint _Amount = (_shares * token.balanceOf(address(this))) / totalSupply;

        _burn(msg.sender, _shares);
        _safeTransfer(msg.sender, _Amount);

        emit Withdrawn(msg.sender, _shares, _Amount);
    }
}
