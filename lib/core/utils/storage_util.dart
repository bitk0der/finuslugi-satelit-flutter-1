import 'package:fin_uslugi/core/network/mapper/credit_mapper/search_responses/api_user.dart';
import 'package:fin_uslugi/core/network/mapper/credit_mapper/user_mapper.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/credit.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/credit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/debit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/user.dart'; /* 
import 'package:fin_uslugi/features/investment_search/domain/models/api_user.dart';
import 'package:fin_uslugi/features/investment_search/domain/models/investment.dart';
import 'package:fin_uslugi/features/investment_search/domain/models/user.dart'; */
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:json_store/json_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class StorageUtil {
  final _jsonStore = JsonStore();

  Future<void> saveUser(User user) {
    return _jsonStore.setItem('user', UserMapper.toApi(user).toMap());
  }

  Future<User> loadUser() async {
    try {
      final result = await _jsonStore.getItem('user');
      return UserMapper.fromApi(ApiUser.fromMap(result!));
    } catch (e) {
      return User(
        credit: Credit(),
        creditCard: CreditCard(),
        debitCard: DebitCard(),
        creditRating: null,
      );
    }
  }

  Future<void> savePaymentsHistory(List<String> history) async {
    final batch = await JsonStore().startBatch();
    JsonStore().deleteLike('payment-%', batch: batch);
    for (int i = 0; i < history.length; i++) {
      await JsonStore().setItem(
        'payment-$i',
        {'invoiceId': history[i]},
        batch: batch,
      );
    }
    JsonStore().commitBatch(batch);
  }

  Future<List<String>> loadPaymentsHistory() async {
    List<Map<String, dynamic>>? json =
        await JsonStore().getListLike('payment-%');
    List<String> history = [];
    if (json != null) {
      for (var element in json) {
        history.add(element['invoiceId']);
      }
    }
    return history;
  }

  bool checkInFavourite(String id) {
    List productsIds =
        GetIt.I<SharedPreferences>().getStringList('mortgagesIDS') ?? [];
    if (productsIds.contains(id)) {
      return true;
    } else {
      return false;
    }
  }
/*   Future<UserInvest> loadUserInvest() async {
    try {
      final result = await _jsonStore.getItem('user');
      return UserMapper.fromApiInvest(ApiUserInvest.fromMap(result!));
    } catch (e) {
      return UserInvest(
        credit: Credit(),
        creditCard: CreditCard(),
        debitCard: DebitCard(),
        investment: Investment(),
        creditRating: null,
      );
    }
  } */

  /* Future<void> saveUserInvest(UserInvest user) {
    return _jsonStore.setItem('user', UserMapper.toApiInvest(user).toMap());
  } */
}
