// Functions
// database service will only offer a minimal service with the database.
// database utils will provide the rest
// getGroups - gets groups from a TabId
// getGroupData - gets groupdata from a single group
// getShopOverviews - gets overview data for all Shops from a TabId
// getShopData - gets a shop from TabId and ShopId

//addGroup
//emoveGroup
// probably no modifygroup, as could break splits
// addShop
// removeShop
// modifyShopData - needs to use Load Linked Store conditional using logical timestamps

// tab Id functions like a key/password. It is provided by the user from the URL (security is NOT paramount so this is OK). there is not a functionality to query tabs
