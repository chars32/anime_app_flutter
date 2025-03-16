import 'package:anime_app/models/animes_model.dart';
import 'package:anime_app/services/api_services.dart';
import 'package:flutter/material.dart';

class AnimeProvider extends ChangeNotifier {
  //fetchAnimeNow List
  List<Anime> _animeList = [];
  List<Anime> get animeList => _animeList;

  // fetchTopAnime
  List<Anime> _topAnimeList = [];
  List<Anime> get topAnimeList => _topAnimeList;

  // fetchAnimeById option
  Anime? _animeById;
  Anime? get animeById => _animeById;
  set animeById(Anime? anime) {
    _animeById = anime;
    notifyListeners();
  }

  // Search anime
  List<Anime> _searchAnimeList = [];
  List<Anime> get searchAnimeList => _searchAnimeList;

  final ApiServices _apiServices = ApiServices();

  String baseUrl = 'https://api.jikan.moe/v4';

  Future<void> fetchAnimeNow() async {
    try {
      final List<dynamic> data = await _apiServices.getAnimesNow();
      _animeList = data.map((json) => Anime.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching anime now: $error');
    }
  }

  Future<void> fetchTopAnime() async {
    try {
      final List<dynamic> data = await _apiServices.getTopAnimes();
      _topAnimeList = data.map((json) => Anime.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      throw Exception('Failed to load data anime: $error}');
    }
  }

  Future<void> fetchAnymeById(int id) async {
    try {
      final Map<String, dynamic> data = await _apiServices.getAnimesById(id);
      _animeById = Anime.fromJson(data);
      notifyListeners();
    } catch (e) {
      print('Error anime by id: $e');
    }
  }

  Future<void> searchAnimes(String query) async {
    try {
      final List<dynamic> data = await _apiServices.searchAnimes(query);
      _searchAnimeList = data.map((json) => Anime.fromJson(json)).toList();
      notifyListeners();
    } catch (error) {
      print('Error search anime: $error');
    }
  }

  void searchAnimesReset() {
    _searchAnimeList = [];
    notifyListeners();
  }
}
