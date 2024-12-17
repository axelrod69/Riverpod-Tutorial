
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_one/core/infrastructure/networkApiServices.dart';

final networkProvider = Provider((ref) => NetworkApiServices());