import 'package:anime_app/presentation/widgets/details_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            context.go('/');
          },
        ),
        title: const Text('Atack on Titan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cover image
            SizedBox(
              width: 390,
              height: 218,
              child: Image.network(
                'https://miro.medium.com/v2/resize:fit:1200/1*ZrHkRXkvNenDc7PJX5V9nw.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // Clasification / Year / Genre
                  const SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 12),
                      child: Text(
                        'TV-MA | 2021 | Action',
                        style: TextStyle(
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
                      const SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.0, top: 4.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nunc necLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nunc necLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nunc necLorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor, nunc nec',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.justify,
                          ),
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
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ),
                      // Rate
                      const DetailsItem(
                        detailTitle: 'Rates',
                        detailSubtitle: '9.1 / 10',
                      ),

                      // Airing Status
                      const DetailsItem(
                        detailTitle: "Airing Status",
                        detailSubtitle: "Completed",
                      ),
                      // Episodes
                      const DetailsItem(
                        detailTitle: "Episodes",
                        detailSubtitle: "24",
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Acción a realizar al presionar el botón
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
      ),
    );
  }
}
