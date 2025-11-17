import 'package:hive_ce_flutter/adapters.dart';
part 'params_model.g.dart';

@HiveType(typeId: 6)
class ParamsModel {
  @HiveField(0)
  List<dynamic> advantages;
  @HiveField(1)
  Map<String, dynamic> comisMore;
  @HiveField(2)
  String created;
  @HiveField(3)
  String dateFrom;
  @HiveField(4)
  String dateTo;
  @HiveField(5)
  Map<String, dynamic> debtorTypes;
  @HiveField(6)
  List<String> dictDateEnd;
  @HiveField(7)
  List<String> dictDateFrom;
  @HiveField(8)
  List<dynamic> dictDocApartment;
  @HiveField(9)
  dynamic dictDocApartmentWys;
  @HiveField(10)
  List<String> dictPaymentType;
  @HiveField(11)
  List<String> dictPurposes;
  @HiveField(12)
  int endTime;
  @HiveField(13)
  dynamic hasBannedDetails;
  @HiveField(14)
  dynamic hasOwnPage;
  @HiveField(15)
  Map<String, dynamic> initialAmounts;
  @HiveField(16)
  Map<String, dynamic> insSec;
  @HiveField(17)
  dynamic insSecComment;
  @HiveField(18)
  List<String> insurance;
  @HiveField(19)
  String link;
  @HiveField(20)
  List<String> location;
  @HiveField(21)
  dynamic maxTime;
  @HiveField(22)
  int minTime;
  @HiveField(23)
  String moreConditions;
  @HiveField(24)
  String productDescription;
  @HiveField(25)
  dynamic productFine;
  @HiveField(26)
  Map<String, dynamic> programs;
  @HiveField(27)
  Map<String, dynamic> purposes;
  @HiveField(28)
  Map<String, dynamic> rates;
  @HiveField(29)
  List<String> security;
  @HiveField(30)
  dynamic securityComment;
  @HiveField(31)
  List<String> solvencyProof;
  @HiveField(32)
  String status;
  @HiveField(33)
  Map<String, dynamic> subProducts;
  @HiveField(34)
  Map<String, dynamic> sums;
  @HiveField(35)
  String tariffDateFrom;
  @HiveField(36)
  String tariffDateTo;
  @HiveField(37)
  Map<String, dynamic> terms;
  @HiveField(38)
  String updated;
  @HiveField(39)
  String userId;
  @HiveField(40)
  String examined;
  @HiveField(41)
  Map<String, dynamic> psk;
  @HiveField(42)
  dynamic hasAPIIntegrationEsia;
  @HiveField(43)
  dynamic hasAPIIntegrationLidgen;
  @HiveField(44)
  bool isTransitionAllowed;
  @HiveField(45)
  double calcMinTerm;
  @HiveField(46)
  double calcMaxTerm;
  @HiveField(47)
  double minRate;
  @HiveField(48)
  double maxRate;
  @HiveField(49)
  int minSum;
  @HiveField(50)
  int maxSum;
  @HiveField(51)
  double minTerm;
  @HiveField(52)
  double maxTerm;
  @HiveField(53)
  double minInitialAmount;
  @HiveField(54)
  dynamic maxInitialAmount;
  @HiveField(55)
  dynamic rateComment;
  @HiveField(56)
  String debtorType;
  @HiveField(57)
  int debtorAge;
  @HiveField(58)
  int endPaymentMaleDebtorAge;
  @HiveField(59)
  int endPaymentFemaleDebtorAge;
  @HiveField(60)
  List<String> docRequirements;
  @HiveField(61)
  dynamic debtorIncome;
  @HiveField(62)
  dynamic lastExperience;
  @HiveField(63)
  dynamic allExperience;
  @HiveField(64)
  List<String> docApplicationOptional;
  @HiveField(65)
  List<String> docApplication;
  @HiveField(66)
  String docApplicationInfo;
  @HiveField(67)
  List<String> debtPrograms;
  @HiveField(68)
  double minPsk;
  @HiveField(69)
  double maxPsk;
  @HiveField(70)
  String dictPurpose;
  @HiveField(71)
  double calcMinRate;
  @HiveField(72)
  double calcMaxRate;
  @HiveField(73)
  int calcMinSum;
  @HiveField(74)
  int calcMaxSum;
  @HiveField(75)
  double topOffersPayment;
  @HiveField(76)
  double topOffersOverPayment;
  @HiveField(77)
  dynamic payment;
  @HiveField(78)
  dynamic paymentRefin;
  @HiveField(79)
  dynamic overPayment;
  @HiveField(80)
  dynamic remainingDebtPercent;
  @HiveField(81)
  int sumCredit;
  @HiveField(82)
  dynamic initialAmountInput;

  ParamsModel({
    required this.advantages,
    required this.comisMore,
    required this.created,
    required this.dateFrom,
    required this.dateTo,
    required this.debtorTypes,
    required this.dictDateEnd,
    required this.dictDateFrom,
    required this.dictDocApartment,
    required this.dictDocApartmentWys,
    required this.dictPaymentType,
    required this.dictPurposes,
    required this.endTime,
    required this.hasBannedDetails,
    required this.hasOwnPage,
    required this.initialAmounts,
    required this.insSec,
    required this.insSecComment,
    required this.insurance,
    required this.link,
    required this.location,
    required this.maxTime,
    required this.minTime,
    required this.moreConditions,
    required this.productDescription,
    required this.productFine,
    required this.programs,
    required this.purposes,
    required this.rates,
    required this.security,
    required this.securityComment,
    required this.solvencyProof,
    required this.status,
    required this.subProducts,
    required this.sums,
    required this.tariffDateFrom,
    required this.tariffDateTo,
    required this.terms,
    required this.updated,
    required this.userId,
    required this.examined,
    required this.psk,
    required this.hasAPIIntegrationEsia,
    required this.hasAPIIntegrationLidgen,
    required this.isTransitionAllowed,
    required this.calcMinTerm,
    required this.calcMaxTerm,
    required this.minRate,
    required this.maxRate,
    required this.minSum,
    required this.maxSum,
    required this.minTerm,
    required this.maxTerm,
    required this.minInitialAmount,
    required this.maxInitialAmount,
    required this.rateComment,
    required this.debtorType,
    required this.debtorAge,
    required this.endPaymentMaleDebtorAge,
    required this.endPaymentFemaleDebtorAge,
    required this.docRequirements,
    required this.debtorIncome,
    required this.lastExperience,
    required this.allExperience,
    required this.docApplicationOptional,
    required this.docApplication,
    required this.docApplicationInfo,
    required this.debtPrograms,
    required this.minPsk,
    required this.maxPsk,
    required this.dictPurpose,
    required this.calcMinRate,
    required this.calcMaxRate,
    required this.calcMinSum,
    required this.calcMaxSum,
    required this.topOffersPayment,
    required this.topOffersOverPayment,
    required this.payment,
    required this.paymentRefin,
    required this.overPayment,
    required this.remainingDebtPercent,
    required this.sumCredit,
    required this.initialAmountInput,
  });

  ParamsModel.fromJson(Map<String, dynamic> json)
      : advantages = json['advantages'] ?? [],
        comisMore = json['comisMore'] == null || json['comisMore'].isEmpty
            ? {}
            : json['comisMore'],
        created = json['created'] ?? '',
        dateFrom = json['dateFrom'] ?? '',
        dateTo = json['dateTo'] ?? '',
        debtorTypes = json['debtorTypes'] ?? {},
        dictDateEnd = json['dictDateEnd'] != null
            ? List<String>.from(json['dictDateEnd'])
            : [],
        dictDateFrom = json['dictDateFrom'] != null
            ? List<String>.from(json['dictDateFrom'])
            : [],
        dictDocApartment = json['dictDocApartment'] ?? [],
        dictDocApartmentWys = json['dictDocApartmentWys'],
        dictPaymentType = json['dictPaymentType'] != null
            ? List<String>.from(json['dictPaymentType'])
            : [],
        dictPurposes = json['dictPurposes'] != null
            ? List<String>.from(json['dictPurposes'])
            : [],
        endTime = json['endTime'] ?? 0,
        hasBannedDetails = json['hasBannedDetails'],
        hasOwnPage = json['hasOwnPage'],
        initialAmounts =
            json['initialAmounts'] == null || json['initialAmounts'].isEmpty
                ? {}
                : json['initialAmounts'],
        insSec = json['insSec'] == null || json['insSec'].isEmpty
            ? {}
            : json['insSec'],
        insSecComment = json['insSecComment'],
        insurance = json['insurance'] != null
            ? List<String>.from(json['insurance'])
            : [],
        link = json['link'] ?? '',
        location =
            json['location'] != null ? List<String>.from(json['location']) : [],
        maxTime = json['maxTime'],
        minTime = json['minTime'] ?? 0,
        moreConditions = json['moreConditions'] ?? '',
        productDescription = json['productDescription'] ?? '',
        productFine = json['productFine'],
        programs = json['programs'] == null || json['programs'].isEmpty
            ? {}
            : json['programs'],
        purposes = json['purposes'] ?? {},
        rates = json['rates'] ?? {},
        security =
            json['security'] != null ? List<String>.from(json['security']) : [],
        securityComment = json['securityComment'],
        solvencyProof = json['solvencyProof'] != null
            ? List<String>.from(json['solvencyProof'])
            : [],
        status = json['status'] ?? '',
        subProducts = json['subProducts'] ?? {},
        sums = json['sums'] ?? {},
        tariffDateFrom = json['tariffDateFrom'] ?? '',
        tariffDateTo = json['tariffDateTo'] ?? '',
        terms = json['terms'] ?? {},
        updated = json['updated'] ?? '',
        userId = json['userId'] ?? '',
        examined = json['examined'] ?? '',
        psk = json['psk'] ?? {},
        hasAPIIntegrationEsia = json['hasAPIIntegrationEsia'],
        hasAPIIntegrationLidgen = json['hasAPIIntegrationLidgen'],
        isTransitionAllowed = json['isTransitionAllowed'] ?? false,
        calcMinTerm =
            json['calcMinTerm'] != null ? json['calcMinTerm'].toDouble() : 0.0,
        calcMaxTerm =
            json['calcMaxTerm'] != null ? json['calcMaxTerm'].toDouble() : 0.0,
        minRate = json['minRate'] != null ? json['minRate'].toDouble() : 0.0,
        maxRate = json['maxRate'] != null ? json['maxRate'].toDouble() : 0.0,
        minSum = json['minSum'] ?? 0,
        maxSum = json['maxSum'] ?? 0,
        minTerm = json['minTerm'] != null ? json['minTerm'].toDouble() : 0.0,
        maxTerm = json['maxTerm'] != null ? json['maxTerm'].toDouble() : 0.0,
        minInitialAmount = json['minInitialAmount'] != null
            ? json['minInitialAmount'].toDouble()
            : 0,
        maxInitialAmount = json['maxInitialAmount'],
        rateComment = json['rateComment'],
        debtorType = json['debtorType'] ?? '',
        debtorAge = json['debtorAge'] ?? 0,
        endPaymentMaleDebtorAge = json['endPaymentMaleDebtorAge'] ?? 0,
        endPaymentFemaleDebtorAge = json['endPaymentFemaleDebtorAge'] ?? 0,
        docRequirements = json['docRequirements'] != null
            ? List<String>.from(json['docRequirements'])
            : [],
        debtorIncome = json['debtorIncome'],
        lastExperience = json['lastExperience'],
        allExperience = json['allExperience'],
        docApplicationOptional = json['docApplicationOptional'] != null
            ? List<String>.from(json['docApplicationOptional'])
            : [],
        docApplication = json['docApplication'] != null
            ? List<String>.from(json['docApplication'])
            : [],
        docApplicationInfo = json['docApplicationInfo'] ?? '',
        debtPrograms = json['debtPrograms'] != null
            ? List<String>.from(json['debtPrograms'])
            : [],
        minPsk = json['minPsk'] != null ? json['minPsk'].toDouble() : 0.0,
        maxPsk = json['maxPsk'] != null ? json['maxPsk'].toDouble() : 0.0,
        dictPurpose = json['dictPurpose'] ?? '',
        calcMinRate =
            json['calcMinRate'] != null ? json['calcMinRate'].toDouble() : 0.0,
        calcMaxRate =
            json['calcMinRate'] != null ? json['calcMinRate'].toDouble() : 0.0,
        calcMinSum = json['calcMinSum'] ?? 0,
        calcMaxSum = json['calcMaxSum'] ?? 0,
        topOffersPayment = json['topOffersPayment'] ?? 0.0,
        topOffersOverPayment = json['topOffersOverPayment'] ?? 0.0,
        payment = json['payment'],
        paymentRefin = json['paymentRefin'],
        overPayment = json['overPayment'],
        remainingDebtPercent = json['remainingDebtPercent'],
        sumCredit = json['sumCredit'] ?? 0,
        initialAmountInput = json['initialAmountInput'];
}
