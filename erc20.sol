// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ConsensusLiquidate is ERC20 {
    constructor(address recipient) ERC20("ConsensusLiquidate", "CLQ") {
        _mint(recipient, 99999999999999 * 10 ** decimals());
    }
}