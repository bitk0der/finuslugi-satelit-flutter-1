import 'package:fin_uslugi/features/cards/data/models/credit/credit.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/credit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/credit/debit_card.dart';
import 'package:fin_uslugi/features/cards/data/models/user.dart';
import 'package:fin_uslugi/features/cards/data/repositories/storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProfileBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  final StorageRepository storageRepository;

  User user = User(
    credit: Credit(),
    creditCard: CreditCard(),
    debitCard: DebitCard(),
    creditRating: 0,
  );

  ProfileBloc({required this.storageRepository})
      : super(ProfileBlocInitialState()) {
    on<ProfileBlocLoadEvent>(_onLoadEvent);
    on<ProfileBlocSaveAndCacheEvent>(_onSaveAndCacheEvent);
    on<ProfileBlocCacheEvent>(_onCacheEvent);
    on<ProfileBlocSaveEvent>(_onSaveEvent);

    add(ProfileBlocLoadEvent());
  }

  Future<void> _onLoadEvent(
      ProfileBlocLoadEvent event, Emitter<ProfileBlocState> emit) async {
    user = await storageRepository.loadUser();
    emit(ProfileBlocUserReadyState(user));
  }

  Future<void> _onSaveAndCacheEvent(ProfileBlocSaveAndCacheEvent event,
      Emitter<ProfileBlocState> emit) async {
    user = event.user;
    await storageRepository.saveUser(user: user);
    emit(ProfileBlocUserReadyState(user));
  }

  void _onCacheEvent(
      ProfileBlocCacheEvent event, Emitter<ProfileBlocState> emit) {
    user = event.user;
    // No state emitted, as original does not yield here
  }

  Future<void> _onSaveEvent(
      ProfileBlocSaveEvent event, Emitter<ProfileBlocState> emit) async {
    await storageRepository.saveUser(user: user);
    emit(ProfileBlocUserReadyState(user));
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
