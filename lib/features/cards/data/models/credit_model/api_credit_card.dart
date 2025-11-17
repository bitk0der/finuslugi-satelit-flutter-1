class ApiCreditCard {
  static const _SUMM = "summ";

  final int? summ;

  ApiCreditCard({
    required this.summ,
  });

  ApiCreditCard.fromMap(Map<String, dynamic> map) : summ = map[_SUMM];

  Map<String, dynamic> toMap() {
    return {
      _SUMM: summ,
    };
  }
}
