class ApiCreditResponse {
  static const _ORGANIZATION_NAME = 'bankName';
  static const _MIN_SUM = 'amountFrom';
  static const _MAX_SUM = 'amountTo';
  static const _MIN_RATE = 'rateMin';
  static const _MAX_RATE = 'rateMax';
  static const _TERM = 'periodTo';
  static const _AGE = 'borrowerAge';
  static const _CONFIRMATION = 'incomeRequirement';
  static const _PLEDGE = 'collateralRequirements';
  static const _CATEGORIES = 'borrowerTypes';
  static const _DOCUMENTS = 'documents';
  static const _LOGO_URL = 'bankLogo';
  static const _BANK_URL = 'bankUrl';
  static const _BANK_PHONE = 'bankPhone';
  static const _WORK_EXPERIENCE = 'workExperience';

  static const _VALUE = 'value';

  final String? organizationName;
  final int? minSum;
  final int? maxSum;
  final double? minRate;
  final double? maxRate;
  final int? term;
  final List? age;
  final List? workExperience;
  final String? confirmation;
  final String? pledge;
  final String? logoURL;
  final String? bankUrl;
  final String? bankPhone;
  final List? categories;
  final List? documents;

  ApiCreditResponse({
    required this.organizationName,
    required this.minSum,
    required this.maxSum,
    required this.minRate,
    required this.maxRate,
    required this.term,
    required this.age,
    required this.confirmation,
    required this.pledge,
    required this.categories,
    required this.documents,
    required this.workExperience,
    required this.logoURL,
    required this.bankUrl,
    required this.bankPhone,
  });

  ApiCreditResponse.fromMap(Map<String, dynamic> map)
      : organizationName = map[_ORGANIZATION_NAME][_VALUE],
        minSum = map[_MIN_SUM][_VALUE],
        maxSum = map[_MAX_SUM][_VALUE],
        minRate = map[_MIN_RATE][_VALUE] is int
            ? map[_MIN_RATE][_VALUE] + .0
            : map[_MIN_RATE][_VALUE],
        maxRate = map[_MAX_RATE][_VALUE] is int
            ? map[_MAX_RATE][_VALUE] + .0
            : map[_MAX_RATE][_VALUE],
        term = map[_TERM][_VALUE],
        age = map[_AGE][_VALUE],
        confirmation = map[_CONFIRMATION][_VALUE],
        pledge = map[_PLEDGE][_VALUE],
        categories = map[_CATEGORIES][_VALUE],
        documents = map[_DOCUMENTS][_VALUE],
        workExperience = map[_WORK_EXPERIENCE][_VALUE],
        logoURL = map[_LOGO_URL][_VALUE],
        bankUrl = map[_BANK_URL][_VALUE],
        bankPhone = map[_BANK_PHONE][_VALUE];
}
