// Types for data modelling. See `data_schema.md`

export type Shares = { [name: string]: number };

export type ItemOnly = {
  name: string;
  price: number;
};
export type Item = ItemOnly & { shares: Shares };

export type GroupData = {
  symbol: string;
  memberShares: Shares;
};
export type Group = GroupData & { name: string };
export type Groups = {
  [groupName: string]: GroupData;
};

export type ShopData = {
  paidBy: string;
  items: Item[];
  moneyOwed: Shares;
};

export type ShopOverview = {
  Name: string;
  paidBy: string;
  totalPaid: number;
};
