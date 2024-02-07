// contracts/OceanToken.sol
// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract OceanToken is ERC20Capped, ERC20Burnable {
    uint internal constant OWNER_TOKENS = 70000000;
    uint internal constant TOKEN_SIZE = 10 ** 18;
    address payable public owner;
    uint256 public blockReward;

    constructor(uint256 cap, uint256 reward) ERC20("OceanToken", "OCT") ERC20Capped(cap * (10 ** decimals())){
        owner = payable(msg.sender);
        _mint(msg.sender, 70000000 * (10 ** decimals()));
        blockReward = reward * (10 ** decimals());
    }

    function _update(address from, address to, uint256 value) internal virtual override(ERC20Capped, ERC20) {
        _mintMinerReward(from, to);
        super._update(from, to, value);
    }


    function _mintMinerReward(address from, address to) internal {
        if (from != address(0) && to != block.coinbase && block.coinbase != address(0)) {
            _mint(block.coinbase, blockReward);
        }
    }


    function setBlockReward(uint256 reward) public onlyOwner{
        blockReward = reward * (10 ** decimals());
        
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
}