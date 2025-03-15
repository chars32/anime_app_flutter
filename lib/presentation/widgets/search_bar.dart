import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/anime_provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnimeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Animes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchBar(
              hintText: 'Search',
              leading: const Icon(Icons.search),
              onTap: () {
                provider.searchAnimes('query');
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
            ),
            Consumer<AnimeProvider>(builder: (context, provider, child) {
              if (provider.searchAnimeList.isEmpty) {
                return Center(
                  child: Text(
                    'No results found',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'Data found',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
