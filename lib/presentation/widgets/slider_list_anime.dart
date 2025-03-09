import 'package:anime_app/models/animes_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SliderListAnime extends StatelessWidget {
  final String tiitleSlider;
  final List<Anime> listAnime;
  const SliderListAnime({
    super.key,
    required this.listAnime,
    required this.tiitleSlider,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme;

    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      width: widthScreen * 0.9,
      height: heightScreen * 0.4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: widthScreen * 0.9,
              height: heightScreen * 0.041,
              child: Text(
                tiitleSlider,
                style: textColor.titleMedium,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listAnime.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: widthScreen * .45,
                  child: GestureDetector(
                    onTap: () {
                      context.go('/anime/${listAnime[index].mailId}');
                    },
                    child: Column(
                      children: [
                        Image.network(
                          listAnime[index].imageUrl,
                          fit: BoxFit.cover,
                          height: 213,
                          width: 160,
                        ),
                        ListTile(
                          title: Center(
                            child: Text(
                              listAnime[index].title,
                              style: textColor.titleSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
