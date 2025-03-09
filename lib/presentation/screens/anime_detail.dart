import 'package:anime_app/presentation/widgets/details_item.dart';
import 'package:anime_app/provider/anime_provider.dart';
import 'package:anime_app/presentation/widgets/synopsis_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimeDetailScreen extends StatefulWidget {
  final String id;

  const AnimeDetailScreen({super.key, required this.id});

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AnimeProvider>(context, listen: false)
        .fetchAnymeById(int.parse(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final anime = Provider.of<AnimeProvider>(context).animeById;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Provider.of<AnimeProvider>(context, listen: false).animeById = null;
            context.go('/');
          },
        ),
        // title: Text('${anime?.title}'),
        title: Text(anime?.title != null ? anime!.title : ''),
        centerTitle: true,
      ),
      body: Consumer<AnimeProvider>(
        builder: (context, animeProvider, _) {
          if (animeProvider.animeById == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Cover image
                SizedBox(
                  width: 200,
                  height: 250,
                  child: Image.network(
                    anime!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Clasification / Year / Genre
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 12),
                          child: Text(
                            '${anime.status} | ${anime.year} | ${anime.type}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // Synopsis
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, bottom: 8.0),
                              child: Text(
                                'Synopsis',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 12.0, top: 4.0),
                              child: SynopsisWidget(synopsis: anime.synopsis),
                            ),
                          ),
                        ],
                      ),
                      // Details
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, bottom: 8.0),
                              child: Text('Details',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ),
                          ),
                          // Rate
                          DetailsItem(
                            detailTitle: 'Rates',
                            detailSubtitle: '${anime.score} / 10',
                          ),

                          // Airing Status
                          DetailsItem(
                            detailTitle: "Airing Status",
                            detailSubtitle: anime.status,
                          ),
                          // Episodes
                          DetailsItem(
                            detailTitle: "Episodes",
                            detailSubtitle: anime.episodes.toString(),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción a realizar al presionar el botón
                              if (anime.videoUrl.isNotEmpty) {
                                launchUrl(Uri.parse(anime.videoUrl));
                              } else {
                                print('No hay vudeo');
                              }
                            },
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xEE1022E7),
                              ),
                            ),
                            child: const Text(
                              'Watch Trailer',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
