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
  Widget build(BuildContext context) {
    final scaffoldBackground = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme;

    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    final animeProvider =
        Provider.of<AnimeProvider>(context, listen: false).fetchAnimeNow();

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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchBarWidget(isSeachVisible: isSeachVisible),
            SizedBox(
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
                        'Airing animes',
                        style: textColor.titleMedium,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: widthScreen * .45,
                          child: GestureDetector(
                            onTap: () {
                              context.go('/movie/id');
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/imagenes/atot.png',
                                  fit: BoxFit.cover,
                                ),
                                ListTile(
                                    title: Center(
                                  child: Text(
                                    'Anime $index',
                                    style: textColor.titleSmall,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                width: widthScreen * .9,
                height: heightScreen * .041,
                child: Text(
                  'Top animes',
                  style: textColor.titleMedium,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: widthScreen * .45,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/imagenes/naruto.png',
                          fit: BoxFit.cover,
                        ),
                        ListTile(
                          title: Center(
                            child: Text(
                              'Anime $index',
                              style: textColor.titleSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 4,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
