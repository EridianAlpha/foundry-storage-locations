# Demo repository for accessing storage slots in Solidity

Reference docs:

- https://github.com/Cyfrin/foundry-fund-me-f23/blob/main/script/DeployStorageFun.s.sol
- https://github.com/Cyfrin/foundry-fund-me-f23/blob/main/src/exampleContracts/FunWithStorage.sol

## Foundry Inspect

```bash
forge inspect StorageSlots storageLayout
```

### Foundry Inspect - Example Output

```text
...
  "storage": [
    {
      "astId": 40940,
      "contract": "src/StorageSlots.sol:StorageSlots",
      "label": "favoriteNumber",
      "offset": 0,
      "slot": "0",
      "type": "t_uint256"
    },
    {
      "astId": 40942,
      "contract": "src/StorageSlots.sol:StorageSlots",
      "label": "someBool",
      "offset": 0,
      "slot": "1",
      "type": "t_bool"
    },
    {
      "astId": 40945,
      "contract": "src/StorageSlots.sol:StorageSlots",
      "label": "myArray",
      "offset": 0,
      "slot": "2",
      "type": "t_array(t_uint256)dyn_storage"
    },
    {
      "astId": 40949,
      "contract": "src/StorageSlots.sol:StorageSlots",
      "label": "myMap",
      "offset": 0,
      "slot": "3",
      "type": "t_mapping(t_uint256,t_bool)"
    }
  ],
...
```

## Cast Storage Slots

Run Anvil

```bash
anvil
```

In a different terminal deploy the script and use `cast storage <CONTRACT_ADDRESS> <STORAGE_SLOT>` to read the storage slot.

```bash
forge script script/DeployStorageSlots.s.sol --rpc-url http://127.0.0.1:8545 --private-key <ANVIL_PRIVATE_KEY_0> --broadcast

cast storage 0x5FbDB2315678afecb367f032d93F642f64180aa3 2
```

## Run Script

```bash
forge build
forge script script/DeployStorageSlots.s.sol
```

### Script - Example Output

```text
== Return ==
0: contract StorageSlots 0x90193C961A926261B756D1E5bb255e67ff9498A1

== Logs ==
  Value at location 0:
  favoriteNumber = 25
  0x0000000000000000000000000000000000000000000000000000000000000019

  Value at location 1:
  someBool = true
  0x0000000000000000000000000000000000000000000000000000000000000001

  Value at location 2:
  Length of myArray = 3
  0x0000000000000000000000000000000000000000000000000000000000000003

  Value at location 3:
  Empty slot for myMap
  0x0000000000000000000000000000000000000000000000000000000000000000

  Value at location 4:
  Empty slot for NOT_IN_STORAGE as it's a constant and not in storage
  0x0000000000000000000000000000000000000000000000000000000000000000

  Value at location 5:
  Empty slot for i_not_in_storage as it's immutable and not in storage
  0x0000000000000000000000000000000000000000000000000000000000000000

  Array storage slot length:
  0x0000000000000000000000000000000000000000000000000000000000000002
  First element storage slot:
  0x405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5ace
  First element in array:
  0x000000000000000000000000000000000000000000000000000000000000006f

  Storage slot for myMap[0]:
  0x3617319a054d772f909f7c479a2cebe5066e836a939412e32403c99029b92eff
  Value of myMap[0]:
  0x0000000000000000000000000000000000000000000000000000000000000001
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
