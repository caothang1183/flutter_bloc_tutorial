part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool wasIncremented;

  CounterState({
    this.counterValue,
    this.wasIncremented,
  });

  CounterState copyWith({
    int counterValue,
    bool wasIncremented,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
      wasIncremented: wasIncremented ?? this.wasIncremented,
    );
  }
}
