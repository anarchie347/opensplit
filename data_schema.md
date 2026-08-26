# Data schema:

- A `tab` is a running split between multiple `group`s
- A `group` has `member`s and shares for each `member`
- A `member` is a physical person. A member is represented by just a string name and nothing else. When splitting something, a `member` pays for it, but it is split between `group`s. Each member has a singleton `group` of just themselves for splitting things to them
- A `shop` refers to a shopping trip, not a physical shop. It is a collection of `item`s being split, where all the items in one `shop` are paid for by one `member`. All `item`s in one `shop` are added together, but can be modified later. A Shop is a JSON object of type `Shop`
- An `item` is the atomic level thing being split, e.g. a pack of carrots. It is split between multiple (or one) `group`s. The payer is determined from the `shop`, not stored again at the `item` level

## tab-members

- `TabId : string` ID of the tab (Partition key)
- `GroupName : string` Name of a group (Sort key)
- `GroupDataJSON : string` Stringified JSON of group data. From the `GroupData` type

## tab-shops

- `TabId : string` ID of the tab (Partition key)
- `ShopId : string` ID of the shop, in the form `YYYY-MM-DD-HH-MM-SS-XXXX` where `XXXX` is a random sequence to guard against multiple transactions per second
- `Name : string` User-facing name of the transaction. Dependent on `ShopJSON`, used for lookups where only the name is needed
- `Price : int` Price in pennies. Dependent on `ShopJSON`, used for lookups where only the price is needed
- `ShopJSON : Shop` JSON object of all the data for the shop
- `Version : int` Logical timestamp for version number. Used to prevent lost writes
