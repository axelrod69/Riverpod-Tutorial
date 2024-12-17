import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_counter_one/features/apiCallScreen/provider/productsProvider.dart';

class ApiCallScreen extends ConsumerStatefulWidget {
  ApiCallScreenState createState() => ApiCallScreenState();
}

class ApiCallScreenState extends ConsumerState<ApiCallScreen> {
  @override
  void initState() {
    // TODO: implement initState
    ref.read(productsProvider.notifier).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsProvider);

    // TODO: implement build
    return Scaffold(
      body: products.isLoading == true
            ? const Center(
              child: CircularProgressIndicator(),
            ) : SizedBox(
              height: 800,
              width: double.infinity,
              child: ListView.builder(
                itemCount: products.products?.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Text(products.products?[index].title ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(products.products?[index].body ?? '')
                  ],
                ),
              ),
            ),
    );
  }
}
