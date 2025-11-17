class CreditCard{
  final int? sum;

  CreditCard({
    this.sum,
  });

  bool isEmpty (){
    return sum == null;
  }

  CreditCard copyWith({
    int? sum,
  }) => CreditCard(
    sum: sum ?? this.sum,
  );
}