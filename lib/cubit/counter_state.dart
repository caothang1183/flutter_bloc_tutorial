part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool wasIncremented;

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

  @override
  List<Object> get props => [this.counterValue, this.wasIncremented];
}
