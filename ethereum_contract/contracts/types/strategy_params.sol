// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

library StrategyParams{
    enum Strategy{
        None,                 // 0: 默认无策略
        DexArbitrage,         // 1: DEX间套利
        TriangularArbitrage,  // 2: 三角套利
        PerpFundingArb,       // 3: 永续合约与现货套利
        LiquidationArb,       // 4: 清算套利
        OracleDelayArb,       // 5: 预言机延迟套利（MEV类）
        CrossChainArb,        // 6: 跨链套利
        MakerTaker,           // 7: 做市/吃单套利
        StatisticalArb        // 8: 统计套利（基于协整或均值回复）
    }

    struct DexArbitrageParams {
        address dexA;          // DEX A 地址（买入）
        address dexB;          // DEX B 地址（卖出）
        address tokenIn;       // 输入代币
        address tokenOut;      // 输出代币
        uint256 amountIn;      // 交易输入数量
        uint256 minProfit;     // 最小期望利润（防止无效套利）
        uint256 slippage;      // 可容忍滑点（以万分比或BPS计）
        // uint256 deadline;      // 策略到期时间（防前跑/超时）
        bool useFlashLoan;     // 是否启用闪电贷
    }

    struct TriangularArbitrage_params{
        address dex;    
        address tokena;
        address tokenb;
        address tokenc;
        address amountIn;
        uint256 minProfit;     // 最小期望利润（防止无效套利）
        bool useFlashLoan;     // 是否启用闪电贷
    }
}