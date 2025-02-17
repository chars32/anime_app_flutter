import 'package:anime_app/presentation/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  bool isSeachVisible = false;

  @override
  Widget build(BuildContext context) {
    final scaffoldBackground = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme;

    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchBarWidget(isSeachVisible: isSeachVisible),
            Container(
              width: widthScreen * .9,
              height: heightScreen * .4,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Airing animes',
                  style: textColor.titleMedium,
                ),
              ),
            ),
            SizedBox(
              height: heightScreen * .02,
            ),
            Container(
              width: widthScreen * .9,
              height: heightScreen * .4,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Top animes',
                  style: textColor.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
