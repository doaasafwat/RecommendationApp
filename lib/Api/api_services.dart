import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recommendation_app/const.dart';

class ApiService {
  static String apiUrlSearch = apiKeySearch;
  static final Dio _dio = Dio();

  static Future<List<String>> fetchProductIds(
      String query, BuildContext context) async {
    final response = await _dio.post(
      apiUrlSearch,
      data: {"question": query},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return List<String>.from(data['product_ids']);
    } else {
      throw Exception('Failed to fetch product IDs');
    }
  }
}
