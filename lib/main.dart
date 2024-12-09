import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_one/counterScreen/presentation/counterScreen.dart';

void main() => runApp(ProviderScope(child: RiverpodCounter()));

class RiverpodCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}
