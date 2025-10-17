// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../../types/strategy_params.sol";


interface IStrategy {
    /// @notice 执行策略，params 为 abi.encode(...) 的具体策略参数
    /// @param executor 主合约地址（可选，用于回调/授权）
    /// @param encodedParams abi.encode(...) 的策略参数
    /// @return profit 返回实际利润（或0）
    function execute(address executor, bytes calldata encodedParams) external payable returns (uint256 profit);

    /// @notice 策略元信息（可选）
    function name() external view returns (string memory);
}