class ApiDebitCard {
  static const _CASHBACK_CATEGORIES = "cashback_categories";
  static const _BALANCE = "balance";
  static const _SPENDING = "spending";

  final List? cashbackCategories;
  final int? balance;
  final int? spending;

  ApiDebitCard(
      {required this.cashbackCategories,
      required this.balance,
      required this.spending});

  ApiDebitCard.fromMap(Map<String, dynamic> map)
      : cashbackCategories = map[_CASHBACK_CATEGORIES],
        balance = map[_BALANCE],
        spending = map[_SPENDING];

  Map<String, dynamic> toMap() {
    return {
      _CASHBACK_CATEGORIES: cashbackCategories,
      _BALANCE: balance,
      _SPENDING: spending,
    };
  }
}
