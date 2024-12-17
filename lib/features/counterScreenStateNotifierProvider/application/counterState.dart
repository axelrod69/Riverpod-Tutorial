import 'package:freezed_annotation/freezed_annotation.dart';

part 'counterState.freezed.dart';

@freezed
class CounterState with _$CounterState {
  factory CounterState({
    @Default(0) int counter,
  }) = _CounterState;

  const CounterState._();
}