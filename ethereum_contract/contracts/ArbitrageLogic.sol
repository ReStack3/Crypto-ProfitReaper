// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "./libraries/BaseArbitrageLogic.sol";
// contract ArbitrageLogic{


//     modifier check(){

//     }

//     // 内置策略函数映射
//     mapping(uint8 => function(bytes calldata) internal returns (uint256)) internalStrategies;

//     constructor() {
//         // 注册内置策略
//         internalStrategies[1] = _executeDexArb;
//         internalStrategies[2] = _executeTriangularArb;
//     }


//     mapping(uint8 => address) public userStrategyContracts; // 存放策略编号 -> 用户策略合约地址
//     uint8[] public userStrategies; // 保存用户注册的编号

//     uint8 constant USER_STRATEGY_START = uint8(StrategyParams.Strategy.StatisticalArb) + 1;

//     function registerUserStrategy(uint8 id, address strategyContract) external {
//         require(id >= USER_STRATEGY_START, "Strategy id too low"); // 检查编号
//         require(strategyContract != address(0), "Invalid address");
//         require(userStrategyContracts[id] == address(0), "Strategy id taken");

//         userStrategyContracts[id] = strategyContract;
//         userStrategies.push(id); // 保存编号，方便查询或遍历
//     }


//      // 核心统一入口
//     function executeArbitrage(uint8 _strategy, bytes calldata params) external returns (uint256 profit) {
        
//         // 内置的套利库
//         if (_strategy < USER_STRATEGY_START) {
//             require(address(internalStrategies[_strategy]) != address(0), "Strategy not found");
//             profit = internalStrategies[_strategy](params); // 调用对应内部函数
//         } else {
//             // 用户注册的策略合约调用逻辑
//             profit = runUserStrategy(_strategy, params);
//         }
//     }
//     }


//     function runStrategy(uint8 strategyId, bytes calldata params) external onlyOperator returns (uint256 profit) {
//         address strat = registry.getStrategy(strategyId);
//         require(strat != address(0) && registry.isEnabled(strat), "strategy not available");

//         // 预检查、设置 gas limit 等
//         uint256 before = address(this).balance; // 或 token balance

//         // 调用策略合约（外部调用，隔离执行）
//         profit = IStrategy(strat).execute{value: msg.value}(address(this), params);

//         uint256 after = address(this).balance;
//         require(after - before >= minProfit, "profit too low");

//         emit StrategyExecuted(strategyId, strat, profit);
//     }

// }

// =========================

contract ArbitrageLogic is BaseArbitrageLogic{

    function execute_arbitrage() external virtual returns(){}

}