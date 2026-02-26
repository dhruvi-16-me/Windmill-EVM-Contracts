// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        // Reads the private key from your environment variables
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Starts broadcasting transactions to the network
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the contract
        Counter counter = new Counter();
        console.log("Counter deployed at:", address(counter));

        // Stop broadcasting
        vm.stopBroadcast();
    }
}