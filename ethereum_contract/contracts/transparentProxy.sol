// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "types/StrategyParams.sol";

contract TransparentProxy{
    address core;

    constructor(address _core) {
        core = _core;
    }
    
    function executeArbitrage(StrategyParams.Strategy _strategy, bytes calldata params) external {
        (bool success, ) = core.delegatecall(
            abi.encodeWithSignature("executeArbitrage(uint8,bytes)", uint8(_strategy), params)
        );
        require(success, "Core call failed");
    }

    // 代理合约提供了一个管理员专用的升级函数,这个函数只能由管理员调用，用于将代理合约指向新的逻辑合约实现。
    function upgradeTo() external {
        require();
    }

    //回退函数
    fallback() external payable {}
}