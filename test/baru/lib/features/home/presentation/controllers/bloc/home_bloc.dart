import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/common.dart';
import '../../../domain/domain.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository;
  int counter = 0;
  HomeBloc({required this.repository}) : super(const _Initial()) {
    on<HomeEvent>(_getData);
    on<_Increment>(_increment);
    on<_Decrement>(_decrement);
  }

  void initialization() {}

  FutureOr<void> _increment(_Increment event, emit) {
    emit(const HomeState.loading());
    counter += 1;
    emit(HomeState.loaded(counter));
  }

  FutureOr<void> _decrement(_Decrement event, emit) {
    emit(const HomeState.loading());
    counter -= 1;
    emit(HomeState.loaded(counter));
  }

  FutureOr<void> _getData(event, emit) async {
    try {} on ServerFailure catch (e) {
      _emitFailed(emit, e.message);
    } catch (e) {
      _emitFailed(emit, e.toString());
    }
  }

  void _emitFailed(Emitter<HomeState> emit, String message) {
    emit(HomeState.failed(message));
  }
}
