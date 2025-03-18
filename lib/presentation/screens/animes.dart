import 'package:anime_app/presentation/widgets/slider_list_anime.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../provider/anime_provider.dart';

class AnimesScreen extends StatefulWidget {
  const AnimesScreen({super.key});

  @override
  State<AnimesScreen> createState() => _AnimesScreenState();
}

class _AnimesScreenState extends State<AnimesScreen> {
  // bool isSeachVisible = false;

  @override
  void initState() {
    super.initState();
    Provider.of<AnimeProvider>(context, listen: false).fetchAnimeNow();
    Provider.of<AnimeProvider>(context, listen: false).fetchTopAnime();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldBackground = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My anime List',
        ),
        centerTitle: true,
        backgroundColor: scaffoldBackground,
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.search),
            onPressed: () {
              context.go('/search');
              // setState(() {
              //   isSeachVisible = !isSeachVisible;
              // });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // SearchBarWidget(isSeachVisible: isSeachVisible),
            Consumer<AnimeProvider>(
              builder: (context, animeProvider, child) {
                if (animeProvider.topAnimeList.isEmpty ||
                    animeProvider.animeList.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                      ),
                    ),
                  );
                }
                return Column(
                  children: [
                    SliderListAnime(
                      tiitleSlider: 'Airing Animes',
                      listAnime: animeProvider.animeList,
                    ),
                    SliderListAnime(
                      tiitleSlider: 'Top Animes',
                      listAnime: animeProvider.topAnimeList,
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
