class LoanResult {
  final double psk;
  final double sumLoan;
  final double overpayment;
  final double totalSum;

  LoanResult({
    required this.psk,
    required this.sumLoan,
    required this.overpayment,
    required this.totalSum,
  });

  static LoanResult empty() {
    return LoanResult(
      psk: 0,
      sumLoan: 0,
      overpayment: 0,
      totalSum: 0,
    );
  }

  LoanResult copyWith({
    double? psk,
    double? sumLoan,
    double? overpayment,
    double? totalSum,
  }) {
    return LoanResult(
      psk: psk ?? this.psk,
      sumLoan: sumLoan ?? this.sumLoan,
      overpayment: overpayment ?? this.overpayment,
      totalSum: totalSum ?? this.totalSum,
    );
  }
}
