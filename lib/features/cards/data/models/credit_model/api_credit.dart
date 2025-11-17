class ApiCredit {
  static const _SUMM = "summ";
  static const _TERM = "term";

  final int? summ;
  final int? term;

  ApiCredit({
    required this.summ,
    required this.term,
  });

  ApiCredit.fromMap(Map<String, dynamic> map)
      : summ = map[_SUMM],
        term = map[_TERM];

  Map<String, dynamic> toMap() {
    return {
      _SUMM: summ,
      _TERM: term,
    };
  }
}
