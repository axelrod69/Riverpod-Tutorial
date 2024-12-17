import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';


@riverpod

class CounterProvider extends _$CounterProvider {

  @override
  int build() => 0;

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

