import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_counter_one/core/infrastructure/networkApiServices.dart';
import 'package:riverpod_counter_one/core/infrastructure/url.dart';
import 'package:riverpod_counter_one/core/sharedProviders/networkProvider.dart';
import 'package:riverpod_counter_one/core/utils/appLog.dart';
import 'package:riverpod_counter_one/features/apiCallScreen/application/productsState.dart';
import 'package:riverpod_counter_one/features/apiCallScreen/domain/products.dart';

class ProductsProvider extends StateNotifier<ProductsState> {
  final NetworkApiServices networkApiServices;

  ProductsProvider(this.networkApiServices, super.state);

  Future<void> getProducts() async {
    try {
      final url = Uri.parse('${Url.baseUrl}${Url.posts}');

      final response =
          await networkApiServices.getApiRequest(url: url.toString());

      final products = (response.data as List)
          .map((json) => Products.fromJson(json))
          .toList();

      state = state.copyWith(isLoading: false, products: products);

      AppLog.appLog('Response: ${state.products}');
    } on DioException catch (e) {
      AppLog.appLog('Dio Exception: ${e.toString()}');
      state = state.copyWith(isLoading: false, products: []);
    } catch (e) {
      AppLog.appLog('Exception: ${e.toString()}');
      state = state.copyWith(isLoading: false, products: []);
    }
  }
}

final productsProvider =
    StateNotifierProvider.autoDispose<ProductsProvider, ProductsState>((ref) =>
        ProductsProvider(ref.read(networkProvider), const ProductsState()));
