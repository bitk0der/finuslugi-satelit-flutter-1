import 'package:fin_uslugi/features/cards/data/models/credit/credit.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/credit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/debit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/user.dart';
import 'package:fin_uslugi/features/cards/data/repositories/storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfileBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBloc({required this.storageRepository})
      : super(ProfileBlocInitialState()) {
    add(ProfileBlocLoadEvent());
  }

  final StorageRepository storageRepository;

  User user = User(
    credit: Credit(),
    creditCard: CreditCard(),
    debitCard: DebitCard(),
    creditRating: 0,
  );

  @override
  Stream<ProfileBlocState> mapEventToState(ProfileBlocEvent event) async* {
    if (event is ProfileBlocLoadEvent) {
      user = await storageRepository.loadUser();
      yield ProfileBlocUserReadyState(user);
    } else if (event is ProfileBlocSaveAndCacheEvent) {
      user = event.user;
      await storageRepository.saveUser(user: user);
      yield ProfileBlocUserReadyState(user);
    } else if (event is ProfileBlocCacheEvent) {
      user = event.user;
    } else if (event is ProfileBlocSaveEvent) {
      await storageRepository.saveUser(user: user);
      yield ProfileBlocUserReadyState(user);
    }
  }
}

abstract class ProfileBlocEvent {}

class ProfileBlocLoadEvent extends ProfileBlocEvent {}

class ProfileBlocSaveEvent extends ProfileBlocEvent {
  final User user;

  ProfileBlocSaveEvent(this.user);
}

class ProfileBlocCacheEvent extends ProfileBlocEvent {
  final User user;

  ProfileBlocCacheEvent(this.user);
}

class ProfileBlocSaveAndCacheEvent extends ProfileBlocEvent {
  final User user;

  ProfileBlocSaveAndCacheEvent(this.user);
}

class ProfileBlocState {}

class ProfileBlocInitialState extends ProfileBlocState {}

class ProfileBlocUserReadyState extends ProfileBlocState {
  final User user;

  ProfileBlocUserReadyState(this.user);
}
