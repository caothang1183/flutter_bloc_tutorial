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

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CounterState(
      counterValue: map['counterValue'],
      wasIncremented: map['wasIncremented'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));

  @override
  String toString() =>
      'CounterState(counterValue: $counterValue, wasIncremented: $wasIncremented)';
}
