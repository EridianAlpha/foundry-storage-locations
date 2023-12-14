// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {StorageSlots} from "../src/StorageSlots.sol";

contract DeployStorageSlots is Script {
    function run() external returns (StorageSlots) {
        vm.startBroadcast();
        StorageSlots storageSlots = new StorageSlots();
        vm.stopBroadcast();
        printStorageData(address(storageSlots));
        printFirstArrayElement(address(storageSlots));
        printMapElement(address(storageSlots));
        return (storageSlots);
    }

    function printStorageData(address contractAddress) public view {
        bytes32 value = vm.load(contractAddress, bytes32(uint256(0)));
        console.log("Value at location 0:");
        console.log("favoriteNumber = 25");
        console.logBytes32(value);
        console.log("");

        value = vm.load(contractAddress, bytes32(uint256(1)));
        console.log("Value at location 1:");
        console.log("someBool = true");
        console.logBytes32(value);
        console.log("");

        value = vm.load(contractAddress, bytes32(uint256(2)));
        console.log("Value at location 2:");
        console.log("Length of myArray = 3");
        console.logBytes32(value);
        console.log("");

        value = vm.load(contractAddress, bytes32(uint256(3)));
        console.log("Value at location 3:");
        console.log("Empty slot for myMap");
        console.logBytes32(value);
        console.log("");

        value = vm.load(contractAddress, bytes32(uint256(4)));
        console.log("Value at location 4:");
        console.log(
            "Empty slot for NOT_IN_STORAGE as it's a constant and not in storage"
        );
        console.logBytes32(value);
        console.log("");

        value = vm.load(contractAddress, bytes32(uint256(5)));
        console.log("Value at location 5:");
        console.log(
            "Empty slot for i_not_in_storage as it's immutable and not in storage"
        );
        console.logBytes32(value);
        console.log("");
    }

    function printFirstArrayElement(address contractAddress) public view {
        bytes32 arrayStorageSlotLength = bytes32(uint256(2));
        console.log("Array storage slot length:");
        console.logBytes32(arrayStorageSlotLength);

        bytes32 firstElementStorageSlot = keccak256(
            abi.encode(arrayStorageSlotLength)
        );
        console.log("First element storage slot:");
        console.logBytes32(firstElementStorageSlot);

        bytes32 value = vm.load(contractAddress, firstElementStorageSlot);
        console.log("First element in array:");
        console.logBytes32(value);
        console.log("");
    }

    function printMapElement(address contractAddress) public view {
        uint256 mapSlot = 3;
        uint256 key = 0;

        // Calculate the storage slot for the key-value pair in the mapping
        bytes32 mapElementStorageSlot = keccak256(abi.encode(key, mapSlot));
        console.log("Storage slot for myMap[0]:");
        console.logBytes32(mapElementStorageSlot);

        // Load the value at the calculated storage slot
        bytes32 value = vm.load(contractAddress, mapElementStorageSlot);
        console.log("Value of myMap[0]:");
        console.logBytes32(value);
    }

    // Option 1
    /*
     * cast storage ADDRESS
     */

    // Option 2
    // cast k 0x0000000000000000000000000000000000000000000000000000000000000002
    // cast storage ADDRESS <OUTPUT_OF_ABOVE>

    // Option 3:
    /*
     * curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"debug_traceTransaction","params":["0xe98bc0fd715a075b83acbbfd72b4df8bb62633daf1768e9823896bfae4758906"],"id":1}' http://127.0.0.1:8545 > debug_tx.json
     * Go through the JSON and find the storage slot you want
     */

    // You could also replay every transaction and track the `SSTORE` opcodes... but that's a lot of work
}
