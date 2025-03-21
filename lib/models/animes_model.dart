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
  final String videoUrl;

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
    required this.videoUrl,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      mailId: json['mal_id'],
      title: json['title_english'] ?? json['title'],
      imageUrl: json['images']['jpg']['image_url'],
      synopsis: json['synopsis'] ?? 'No synopsis avaiable',
      score: json['score'] != null ? json['score'].toString() : 'No score',
      type: json['type'] ?? 'No type',
      episodes: json['episodes'] != null
          ? json['episodes'].toString()
          : 'No episodes',
      year: json['year'] != null ? json['year'].toString() : 'No year',
      status: json['status'] ?? 'No status',
      videoUrl: json['trailer']['url'] ?? 'No trailer',
    );
  }
}
