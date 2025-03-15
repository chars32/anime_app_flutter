import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();

  final String baseUrl = 'https://api.jikan.moe/v4';

  Future<List<dynamic>> getAnimesNow() async {
    final response = await dio.get('$baseUrl/seasons/now');

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = response.data['data'];
      return jsonResponse;
    } else {
      throw Exception('Failde to load animes now');
    }
  }

  Future<List<dynamic>> getTopAnimes() async {
    final response = await dio.get('$baseUrl/top/anime');

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = response.data['data'];
      return jsonResponse;
    } else {
      throw Exception('Failed to load Top Animes');
    }
  }

  Future<Map<String, dynamic>> getAnimesById(int id) async {
    final response = await dio.get('$baseUrl/anime/$id');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = response.data['data'];
      return jsonResponse;
    } else {
      throw Exception('Failed to load Top Animes');
    }
  }

  Future<List<dynamic>> searchAnimes(String query) async {
    final response = await dio.get('$baseUrl/anime?q=$query');

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = response.data['data'];
      return jsonResponse;
    } else {
      throw Exception('Failed to load search animes');
    }
  }
}
