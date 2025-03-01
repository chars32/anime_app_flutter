import 'dart:convert';

import 'package:anime_app/models/animes_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AnimeProvider extends ChangeNotifier {
  //fetchAnimeNow List
  List<Anime> _animeList = [];
  List<Anime> get animeList => _animeList;

  // fetchAnimeById option
  Anime? _animeById;
  Anime? get animeById => _animeById;

  String baseUrl = 'https://api.jikan.moe/v4';

  Future<void> fetchAnimeNow() async {
    // Fetch data from API
    try {
      final dio = Dio();
      final response = await dio.get('$baseUrl/seasons/now');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        _animeList = data.map((item) => Anime.fromJson(item)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load data anime: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching anime: $e');
    }
  }

  Future<void> fetchAnymeById(int id) async {
    try {
      final dio = Dio();
      final response = await dio.get('$baseUrl/anime/$id');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'];
        _animeById = Anime.fromJson(data);
        notifyListeners();
      } else {
        throw Exception('Failed to load anime by id: ${response.statusCode}');
      }
    } catch (e) {
      print('Error anime by id: $e');
    }
  }
}
