// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {MockERC20} from "../src/mocks/MockERC20.sol";
import {Windmill} from "../src/core/Windmill.sol";

/**
 * @title Deploy
 * @notice Base deployment script. Deploys MockERC20 token A, token B, and Windmill core.
 * @dev Minimal script for CI and local dev; no mint or configuration logic.
 */
contract Deploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envOr("PRIVATE_KEY", uint256(0));
        if (deployerPrivateKey == 0) {
            deployerPrivateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80; // anvil default #0
        }
        vm.startBroadcast(deployerPrivateKey);

        MockERC20 tokenA = new MockERC20("Token A", "TKA");
        MockERC20 tokenB = new MockERC20("Token B", "TKB");
        Windmill windmill = new Windmill();

        console.log("MockERC20 Token A:", address(tokenA));
        console.log("MockERC20 Token B:", address(tokenB));
        console.log("Windmill:", address(windmill));

        vm.stopBroadcast();
    }
}
