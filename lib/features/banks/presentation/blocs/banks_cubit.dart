import 'package:fin_uslugi/features/banks/data/models/bank_model.dart';
import 'package:fin_uslugi/features/banks/domain/repositories/banks_repository.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/search_responses/response.dart'
    as res;
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BanksCubit extends Cubit<BanksState> {
  BanksCubit(this.repository) : super(BanksInitialState());
  final BanksRepository repository;

  List<BankInfo> banks = [];

  Future<void> getBanks(int page, String searchString) async {
    if (page == 1) emit(BanksLoadingState());
    try {
      var response =
          await repository.searchBanks(page: page, searchString: searchString);
      banks = response.products as List<BankInfo>;
      emit(BanksGetReadyState(banks: response));
    } catch (error) {
      String? message;
      if (error is DioException) {
        message = error.message;
      }
      emit(BanksErrorState(message));
    }
  }

  Future<void> getBank(int id) async {
    emit(BankLoadingState());
    try {
      BankInfo bank = await repository.searchBank(id: id);
      emit(BankGetReadyState(bank: bank));
    } catch (error) {
      String? message;
      if (error is DioException) {
        message = error.message;
      }
      emit(BanksErrorState(message));
    }
  }
}

sealed class BanksState {}

final class BanksInitialState extends BanksState {}

final class BanksLoadingState extends BanksState {}

final class BankLoadingState extends BanksState {}

final class BankGetReadyState extends BanksState {
  final BankInfo bank;

  BankGetReadyState({required this.bank});
}

final class BanksGetReadyState extends BanksState {
  final res.Response banks;

  BanksGetReadyState({required this.banks});
}

final class BanksErrorState extends BanksState {
  final String? text;

  BanksErrorState([this.text]);
}
