class ApiCreditCardResponse {
  static const _CARD_NAME = 'cardName';
  static const _CARD_IMAGE = 'cardImage';
  static const _BANK_IMAGE = 'bankImage';
  static const _BANK_PHONE = 'bankPhone';
  static const _BANK_URL = 'bankUrl';
  static const _PRICE = 'minPrice';
  static const _CASHBACK = 'cardCashback';
  static const _MIN_RATE = 'rateFrom';
  static const _MAX_RATE = 'rateTo';
  static const _LIMIT = 'amountTo';
  static const _GRACE_PERIOD = 'gracePeriod';

  static const _VALUE = 'value';

  final String? cardName;
  final String? cardImage;
  final String? bankImage;
  final String? bankPhone;
  final String? bankUrl;
  final int? price;
  final String? cashback;
  final double? minRate;
  final double? maxRate;
  final String? gracePeriod;
  final int? limit;

  ApiCreditCardResponse({
    required this.cardName,
    required this.cardImage,
    required this.bankImage,
    required this.bankPhone,
    required this.bankUrl,
    required this.price,
    required this.cashback,
    required this.minRate,
    required this.maxRate,
    required this.gracePeriod,
    required this.limit,
  });

  ApiCreditCardResponse.fromMap(Map<String, dynamic> map)
      : cardName = map[_CARD_NAME][_VALUE],
        cardImage = map[_CARD_IMAGE][_VALUE],
        bankImage = map[_BANK_IMAGE][_VALUE],
        bankPhone = map[_BANK_PHONE][_VALUE],
        bankUrl = map.containsKey(_BANK_URL) ? map[_BANK_URL][_VALUE] : null,
        price = map[_PRICE][_VALUE],
        cashback = map[_CASHBACK][_VALUE],
        minRate = map[_MIN_RATE][_VALUE] is double
            ? map[_MIN_RATE][_VALUE]
            : map[_MIN_RATE][_VALUE] + .0,
        maxRate = map[_MAX_RATE][_VALUE] is double
            ? map[_MAX_RATE][_VALUE]
            : map[_MAX_RATE][_VALUE] + .0,
        gracePeriod = map[_GRACE_PERIOD][_VALUE],
        limit = map[_LIMIT][_VALUE];
}
