import 'package:anime_app/provider/anime_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AnimeSlider extends StatelessWidget {
  final String titleSlider;

  const AnimeSlider({
    super.key,
    required this.titleSlider,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme;

    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      width: widthScreen * .9,
      height: heightScreen * .4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: widthScreen * .9,
              height: heightScreen * .041,
              child: Text(
                titleSlider,
                style: textColor.titleMedium,
              ),
            ),
          ),
          Consumer<AnimeProvider>(
            builder: (context, animeAiringProvider, child) {
              return animeAiringProvider.animeList.isEmpty
                  ? SizedBox(
                      height: heightScreen * 0.30,
                      width: widthScreen * 0.55,
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: widthScreen * .45,
                            child: GestureDetector(
                              onTap: () {
                                context.go(titleSlider == 'Airing animes'
                                    ? '/anime/${animeAiringProvider.animeList[index].mailId} '
                                    : '/anime/${animeAiringProvider.topAnimeList[index].mailId}');
                              },
                              child: Column(
                                children: [
                                  Image.network(
                                    titleSlider == 'Airing animes'
                                        ? animeAiringProvider
                                            .animeList[index].imageUrl
                                        : animeAiringProvider
                                            .topAnimeList[index].imageUrl,
                                    fit: BoxFit.cover,
                                    height: 213,
                                    width: 160,
                                  ),
                                  ListTile(
                                      title: Center(
                                    child: Text(
                                      titleSlider == 'Airing animes'
                                          ? animeAiringProvider
                                              .animeList[index].title
                                          : animeAiringProvider
                                              .topAnimeList[index].title,
                                      style: textColor.titleSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: animeAiringProvider.animeList.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
