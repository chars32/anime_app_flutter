class Anime {
  final int mailId;
  final String title;
  final String imageUrl;
  final String synopsis;
  final String score;
  final String type;
  final String episodes;
  final String year;
  final String status;

  Anime({
    required this.mailId,
    required this.title,
    required this.imageUrl,
    required this.synopsis,
    required this.score,
    required this.type,
    required this.episodes,
    required this.year,
    required this.status,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      mailId: json['mal_id'],
      title: json['title'],
      imageUrl: json['image_url'],
      synopsis: json['synopsis'],
      score: json['score'],
      type: json['type'],
      episodes: json['episodes'],
      year: json['year'],
      status: json['status'],
    );
  }
}
