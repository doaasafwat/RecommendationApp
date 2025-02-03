import 'package:dio/dio.dart';
import 'package:recommendation_app/const.dart';

class ApiService {
  final Dio dio = Dio();

  Future<dynamic> get({String? token}) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      Response response = await dio.get(
        apiKey,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e) {
      throw Exception('there is a problem with statusCode ${e}');
    }
  }
}
