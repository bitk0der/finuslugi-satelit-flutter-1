class ApiMortgageCalculatorParameters {
  static const _SUM = "sum";
  static const _INITIAL_PAYMENT = "initial_payment";
  static const _TERM = "term";
  static const _RATE = "rate";
  static const _PAYMENT_TYPE = "payment_type";

  final int? sum;
  final int? initialPayment;
  final int? term;
  final double? rate;
  final int paymentType;

  ApiMortgageCalculatorParameters({
    required this.sum,
    required this.initialPayment,
    required this.term,
    required this.rate,
    required this.paymentType,
  });

  ApiMortgageCalculatorParameters.fromMap(Map<String, dynamic> map)
      : sum = map[_SUM],
        initialPayment = map[_INITIAL_PAYMENT],
        term = map[_TERM],
        rate = map[_RATE],
        paymentType = map[_PAYMENT_TYPE] ?? 0;

  Map<String, dynamic> toMap() {
    return {
      _SUM: sum,
      _INITIAL_PAYMENT: initialPayment,
      _TERM: term,
      _RATE: rate,
      _PAYMENT_TYPE: paymentType,
    };
  }
}
