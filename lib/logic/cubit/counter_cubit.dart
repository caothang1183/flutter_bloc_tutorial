import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  // final InternetCubit internetCubit;
  // StreamSubscription internetStreamSubscription;
  // CounterCubit({@required this.internetCubit})
  //     : super(CounterState(counterValue: 0, wasIncremented: false)) {
  //   monitorInternetCubit();
  // }
  // StreamSubscription<InternetState> monitorInternetCubit() {
  //   return internetStreamSubscription =
  //       internetCubit.stream.listen((internetState) {
  //     if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Wifi) {
  //       increment();
  //     } else if (internetState is InternetConnected &&
  //         internetState.connectionType == ConnectionType.Mobile) {
  //       decrement();
  //     }
  //   });
  // }
  // @override
  // Future<void> close() {
  //   internetStreamSubscription.cancel();
  //   return super.close();
  // }

  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(CounterState(
        counterValue: state.counterValue + 1,
        wasIncremented: true,
      ));

  void decrement() => emit(CounterState(
        counterValue: state.counterValue - 1,
        wasIncremented: false,
      ));

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    addError(Exception("Couldn't write to storage!"), StackTrace.current);
    return state.toMap();
  }
}
