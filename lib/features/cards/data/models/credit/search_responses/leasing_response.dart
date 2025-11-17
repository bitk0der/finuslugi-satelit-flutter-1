

class LeasingResponse {
  final String organizationName;
  final double initialFee;
  final int term;
  final double annual;
  final int sum;
  final int fullSum;
  final int payment;

  LeasingResponse({
     required this.organizationName,
     required this.initialFee,
     required this.term,
     required this.annual,
     required this.sum,
     required this.fullSum,
     required this.payment,
  });
}