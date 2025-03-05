import 'package:anime_app/presentation/widgets/anime_slider.dart';
import 'package:anime_app/presentation/widgets/search_bar.dart';
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
  bool isSeachVisible = false;

  @override
  void initState() {
    super.initState();
    Provider.of<AnimeProvider>(context, listen: false).fetchAnimeNow();
    Provider.of<AnimeProvider>(context, listen: false).fetchTopAnime();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldBackground = Theme.of(context).scaffoldBackgroundColor;

    // final textColor = Theme.of(context).textTheme;

    // final heightScreen = MediaQuery.of(context).size.height;
    // final widthScreen = MediaQuery.of(context).size.width;

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
              setState(() {
                isSeachVisible = !isSeachVisible;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchBarWidget(isSeachVisible: isSeachVisible),
            const AnimeSlider(
              titleSlider: 'Airing animes',
            ),
            const AnimeSlider(
              titleSlider: 'Top animes',
            ),
          ],
        ),
      ),
    );
  }
}
