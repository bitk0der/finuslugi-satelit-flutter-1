import 'package:fin_uslugi/core/network/mapper/credit_mapper/credit_card_mapper.dart';
import 'package:fin_uslugi/core/network/mapper/credit_mapper/credit_mapper.dart';
import 'package:fin_uslugi/core/network/mapper/credit_mapper/debit_card_mapper.dart';
import 'package:fin_uslugi/core/network/mapper/credit_mapper/search_responses/api_user.dart';
import 'package:fin_uslugi/features/cards/data/models/user.dart'; /* 
import 'package:fin_uslugi/features/investment_search/data/investment_mapper.dart';
import 'package:fin_uslugi/features/investment_search/domain/models/api_user.dart';
import 'package:fin_uslugi/features/investment_search/domain/models/user.dart'; */

class UserMapper {
  static User fromApi(ApiUser apiUser) {
    return User(
      firstName: apiUser.firstName,
      age: apiUser.age,
      credit: CreditMapper.fromApi(apiUser.credit),
      creditCard: CreditCardMapper.fromApi(apiUser.creditCard),
      debitCard: DebitCardMapper.fromApi(apiUser.debitCard),
      creditRating: apiUser.creditRating,
    );
  }

  static ApiUser toApi(User user) {
    return ApiUser(
      firstName: user.firstName,
      age: user.age,
      credit: CreditMapper.toApi(user.credit),
      creditCard: CreditCardMapper.toApi(user.creditCard),
      debitCard: DebitCardMapper.toApi(user.debitCard),
      creditRating: user.creditRating,
    );
  }

  /* static UserInvest fromApiInvest(ApiUserInvest apiUser) {
    return UserInvest(
      firstName: apiUser.firstName,
      age: apiUser.age,
      credit: CreditMapper.fromApi(apiUser.credit),
      creditCard: CreditCardMapper.fromApi(apiUser.creditCard),
      debitCard: DebitCardMapper.fromApi(apiUser.debitCard),
      investment: InvestmentMapper.fromApi(apiUser.investment),
      creditRating: apiUser.creditRating,
    );
  }

  static ApiUserInvest toApiInvest(UserInvest user) {
    return ApiUserInvest(
      firstName: user.firstName,
      age: user.age,
      credit: CreditMapper.toApi(user.credit),
      creditCard: CreditCardMapper.toApi(user.creditCard),
      debitCard: DebitCardMapper.toApi(user.debitCard),
      investment: InvestmentMapper.toApi(user.investment),
      creditRating: user.creditRating,
    );
  } */
}
