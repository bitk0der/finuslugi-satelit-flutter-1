class ApiCreditCalculatorParameters {
  static const _SUM = "sum";
  static const _TERM = "term";
  static const _RATE = "rate";
  static const _PAYMENT_TYPE = "payment_type";

  final int? sum;
  final int? term;
  final double? rate;
  final int paymentType;

  ApiCreditCalculatorParameters({
    required this.sum,
    required this.term,
    required this.rate,
    required this.paymentType,
  });

  ApiCreditCalculatorParameters.fromMap(Map<String, dynamic> map)
      : sum = map[_SUM],
        term = map[_TERM],
        rate = map[_RATE],
        paymentType = map[_PAYMENT_TYPE] ?? 0;

  Map<String, dynamic> toMap() {
    return {
      _SUM: sum,
      _TERM: term,
      _RATE: rate,
      _PAYMENT_TYPE: paymentType,
    };
  }
}
