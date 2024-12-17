import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_counter_one/features/apiCallScreen/domain/products.dart';

part 'productsState.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState(
      {@Default(true) bool isLoading,
      List<Products>? products}) = _ProductsState;

  const ProductsState._();
}
