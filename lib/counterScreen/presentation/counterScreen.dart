import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_one/counterScreen/provider/provider.dart';

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProviderProvider);

    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () => ref.read(counterProviderProvider.notifier).increment(),
                child: const Text('+')),
            Text(count.toString()),
            ElevatedButton(
                onPressed: () => ref.read(counterProviderProvider.notifier).decrement(),
                child: const Text('-'))
          ],
        ),
      ),
    );
  }
}
