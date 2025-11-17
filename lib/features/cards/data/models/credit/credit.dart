class Credit {
  final int? sum;
  final int? term;

  Credit({
    this.sum,
    this.term,
  });

  bool isEmpty() {
    return sum == null || term == null;
  }

  Credit copyWith({
    int? summ,
    int? term,
    bool? referenceNDFL,
    bool? procuring,
  }) =>
      Credit(
        sum: summ ?? sum,
        term: term ?? this.term,
      );
}
