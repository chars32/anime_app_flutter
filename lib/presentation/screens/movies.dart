import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldBackground = Theme.of(context).scaffoldBackgroundColor;
    final algo = Theme.of(context).textTheme.titleMedium;

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
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            'Movies Screen',
            style: algo,
            // style: TextStyle(
            //   fontSize: 24,
            //   color: Colors.white,
            // ),
          ),
        ),
      ),
    );
  }
}
