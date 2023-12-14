## Demo repository for accessing storage slots in Solidity

Reference docs:

- https://github.com/Cyfrin/foundry-fund-me-f23/blob/main/script/DeployStorageFun.s.sol
- https://github.com/Cyfrin/foundry-fund-me-f23/blob/main/src/exampleContracts/FunWithStorage.sol

## Run

```bash
forge build
forge script script/DeployStorageSlots.s.sol
```

## Example Output

```
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
