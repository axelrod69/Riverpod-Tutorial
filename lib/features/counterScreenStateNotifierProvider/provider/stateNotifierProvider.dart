import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../application/counterState.dart';

class CounterTwo extends StateNotifier<CounterState> {
  CounterTwo(super.state);

  @override
  CounterState build()=> CounterState();

  void incrementCounter() {
    state = state.copyWith(counter: state.counter + 1);
  }

  void decrementCounter() {
    state = state.copyWith(counter: state.counter - 1);
  }
}

final counterTwo = StateNotifierProvider<CounterTwo, CounterState>(
    (ref) => CounterTwo(CounterState()));
