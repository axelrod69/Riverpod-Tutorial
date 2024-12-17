import 'package:dio/dio.dart';
import 'package:riverpod_counter_one/core/infrastructure/dioExceptions.dart';
import 'package:riverpod_counter_one/core/infrastructure/header.dart';
import '../utils/appLog.dart';
import 'baseApiServices.dart';
import 'url.dart';

class NetworkApiServices implements BaseApiServices {
  final Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json));

  final Header header = Header();

  @override
  Future getApiRequest({required String url}) async {
    // TODO: implement getApiRequest
    try {
      dio.options.headers.addAll(header.header());
      final response = await dio.get(url);
      return response;
    } on DioException catch (e) {
      var error = DioExceptions.fromDioError(e);
      throw error.toString();
    }
  }
}
