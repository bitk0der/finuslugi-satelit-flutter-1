class DebitCard{
  final List<String>? cashbackCategories;
  final int? balance;
  final int? spending;

  DebitCard({
    this.cashbackCategories,
    this.balance,
    this.spending
  });

  bool isEmpty () {
    return balance == null || spending == null;
  }

  DebitCard copyWith({
    List<String>? cashbackCategories,
    int? balance,
    int? spending,
  }) => DebitCard(
    cashbackCategories: cashbackCategories ?? this.cashbackCategories,
    balance: balance ?? this.balance,
    spending: spending ?? this.spending,
  );
}