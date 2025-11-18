import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersBlocStateInitial()) {
    on<ChangeFilters>(_onFiltersChanged);
    on<ChangeTabIndex>(_onChangeTabIndex);
  }
  int index = 0;
  _onFiltersChanged(ChangeFilters event, emit) async {
    try {
      emit(FiltersChangedReadyState());
    } catch (e) {
      emit(LocalError());
    }
  }

  _onChangeTabIndex(ChangeTabIndex event, emit) async {
    try {
      index = event.index;
      emit(ChangeTabIndexReadyState(index: event.index));
    } catch (e) {
      emit(LocalError());
    }
  }
}

@immutable
abstract class FiltersEvent {}

class ChangeFilters extends FiltersEvent {}

class ChangeTabIndex extends FiltersEvent {
  final int index;
  ChangeTabIndex({required this.index});
}

class DeleteAllProducts extends FiltersEvent {}

@immutable
abstract class FiltersState {}

class FiltersBlocStateInitial extends FiltersState {}

class FiltersChangedReadyState extends FiltersState {}

class ChangeTabIndexReadyState extends FiltersState {
  final int index;
  ChangeTabIndexReadyState({required this.index});
}

class MortgageSuccessfullyDeletedFromFavourite extends FiltersState {}

class LocalLoading extends FiltersState {}

class LocalError extends FiltersState {}
