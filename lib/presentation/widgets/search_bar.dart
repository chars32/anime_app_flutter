import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../provider/anime_provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Animes'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchBar(
              hintText: 'Search',
              leading: const Icon(Icons.search),
              trailing: [
                IconButton(
                  onPressed: () {
                    _controller.clear();
                    Provider.of<AnimeProvider>(context, listen: false)
                        .searchAnimesReset();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ],
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
                if (provider.searchAnimeList.isEmpty ||
                    _controller.text.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        'Empty',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView.builder(
                      itemCount: provider.searchAnimeList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              context.go(
                                  '/anime/${provider.searchAnimeList[index].mailId}');
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Image.network(
                                    provider.searchAnimeList[index].imageUrl,
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    provider.searchAnimeList[index].title,
                                    style: const TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
