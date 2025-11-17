class ApiDebitCardResponse {
  static const _CARD_NAME = 'cardName';
  static const _CARD_IMAGE = 'cardImage';
  static const _BANK_IMAGE = 'bankImage';
  static const _BANK_PHONE = 'bankPhone';
  static const _BANK_URL = 'bankUrl';
  static const _MIN_PRICE = 'minPrice';
  static const _MAX_PRICE = 'maxPrice';
  static const _MIN_CASHBACK = 'cardCashbackMin';
  static const _MAX_CASHBACK = 'cardCashbackMax';
  static const _MAX_RATE = 'cardRateMax';
  static const _MIN_RATE = 'cardRateMin';

  static const _VALUE = 'value';

  final String? cardName;
  final String? cardImage;
  final String? bankPhone;
  final String? bankUrl;
  final String? bankImage;
  final int? minPrice;
  final int? maxPrice;
  final double? minCashback;
  final double? maxCashback;
  final double? minRate;
  final double? maxRate;

  ApiDebitCardResponse({
    this.cardName,
    this.cardImage,
    this.bankImage,
    this.bankPhone,
    this.bankUrl,
    this.minPrice,
    this.maxPrice,
    this.minCashback,
    this.maxCashback,
    this.minRate,
    this.maxRate,
  });

  ApiDebitCardResponse.fromMap(Map<String, dynamic> map)
      : cardName = map[_CARD_NAME][_VALUE],
        cardImage = map[_CARD_IMAGE][_VALUE],
        bankImage = map[_BANK_IMAGE][_VALUE],
        bankPhone = map[_BANK_PHONE][_VALUE],
        bankUrl = map.containsKey(_BANK_URL) ? map[_BANK_URL][_VALUE] : null,
        minPrice = map[_MIN_PRICE][_VALUE],
        maxPrice = map[_MAX_PRICE][_VALUE],
        minCashback = map[_MIN_CASHBACK][_VALUE] is int
            ? map[_MIN_CASHBACK][_VALUE] + .0
            : map[_MIN_CASHBACK][_VALUE],
        maxCashback = map[_MAX_CASHBACK][_VALUE] is int
            ? map[_MAX_CASHBACK][_VALUE] + .0
            : map[_MAX_CASHBACK][_VALUE],
        minRate = map[_MIN_RATE][_VALUE] is int
            ? map[_MIN_RATE][_VALUE] + .0
            : map[_MIN_RATE][_VALUE],
        maxRate = map[_MAX_RATE][_VALUE] is int
            ? map[_MAX_RATE][_VALUE] + .0
            : map[_MAX_RATE][_VALUE];
}
