import 'package:anime_app/presentation/screens/movie_detail.dart';
import 'package:anime_app/presentation/screens/movies.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MoviesScreen(),
    ),
    GoRoute(
      path: '/movie/id',
      builder: (context, state) => const MovieDetailScreen(),
    ),
  ],
);
