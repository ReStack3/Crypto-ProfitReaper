// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./libraries/IStrategyMgr.sol";

contract StrategyMgr is IStrategyMgr {
    address public admin;
    mapping(uint8 => address) public strategyById; // Strategy enum index -> impl address
    mapping(address => bool) public isEnabled;

    event Registered(uint8 indexed id, address impl);
    event Enabled(address impl, bool enabled);

    modifier onlyAdmin() { require(msg.sender == admin, "only admin"); _; }

    constructor() { admin = msg.sender; }

    function register(uint8 id, address impl) external onlyAdmin {
        strategyById[id] = impl;
        isEnabled[impl] = true;
        emit Registered(id, impl);
    }

    function setEnabled(address impl, bool enabled) external onlyAdmin {
        isEnabled[impl] = enabled;
        emit Enabled(impl, enabled);
    }

    function getStrategy(uint8 id) external view returns (address) {
        return strategyById[id];
    }
}
