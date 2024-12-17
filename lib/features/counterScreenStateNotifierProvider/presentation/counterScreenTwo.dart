import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_one/features/counterScreenStateNotifierProvider/provider/stateNotifierProvider.dart';

class CounterScreenTwo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counterProvider = ref.watch(counterTwo);

    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: () => ref.read(counterTwo.notifier).incrementCounter(), child: const Text('+')),
            Text(counterProvider.counter.toString()),
            ElevatedButton(onPressed: () => ref.read(counterTwo.notifier).decrementCounter(), child: const Text('-')),
          ],
        ),
      ),
    );
  }
}
