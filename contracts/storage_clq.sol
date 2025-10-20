// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract PaidStorage {
    using SafeERC20 for IERC20;

    IERC20 public clqToken;
    address public owner;
    uint256 public fee = 10 * 10 ** 18;
    uint256 private number;

    error InsufficientAllowance();
    error InsufficientBalance();

    constructor(address _clqAddress) {
        clqToken = IERC20(_clqAddress);
        owner = msg.sender;
    }

    function store(uint256 num) external {
        if (clqToken.allowance(msg.sender, address(this)) < fee) revert InsufficientAllowance();
        if (clqToken.balanceOf(msg.sender) < fee) revert InsufficientBalance();

        clqToken.safeTransferFrom(msg.sender, owner, fee);
        number = num;
    }

    function retrieve() external view returns (uint256) {
        return number;
    }

    function setFee(uint256 newFee) external {
        require(msg.sender == owner, "Only owner");
        fee = newFee;
    }
}