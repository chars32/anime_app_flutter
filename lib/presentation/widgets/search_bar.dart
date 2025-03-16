import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/anime_provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

final TextEditingController _controller = TextEditingController();

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
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
              controller: _controller,
              onChanged: (value) {
                Provider.of<AnimeProvider>(context, listen: false)
                    .searchAnimes(value);
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
            ),
            Consumer<AnimeProvider>(
              builder: (context, provider, child) {
                if (provider.searchAnimeList.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        'No search animes',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: provider.searchAnimeList.length,
                    itemBuilder: (context, index) {
                      return Text(
                        provider.searchAnimeList[index].title,
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
