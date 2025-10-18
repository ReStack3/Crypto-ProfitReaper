// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../types/StrategyParams.sol";

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
}