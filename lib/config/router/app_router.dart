import 'package:anime_app/presentation/screens/anime_detail.dart';
import 'package:anime_app/presentation/screens/animes.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AnimesScreen(),
    ),
    GoRoute(
      path: '/movie/id',
      builder: (context, state) => const AnimeDetailScreen(),
    ),
  ],
);
