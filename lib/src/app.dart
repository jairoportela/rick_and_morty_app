import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/characters/data/repositories/character_repository.dart';
import 'package:rick_and_morty_app/src/core/config/routes.dart';
import 'package:rick_and_morty_app/src/core/core.dart';
import 'package:rick_and_morty_app/src/core/theme/app_theme.dart';
import 'package:rick_and_morty_app/src/episodes/data/repositories/episode_repository.dart';
import 'package:rick_and_morty_app/src/home/home_screen.dart';
import 'package:rick_and_morty_app/src/locations/data/repositories/location_repository.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final RickAndMortyApiRepository repository = RickAndMortyApiRepository();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CharacterRepository(repository: repository),
        ),
        RepositoryProvider(
          create: (context) => LocationRepository(repository: repository),
        ),
        RepositoryProvider(
          create: (context) => EpisodeRepository(repository: repository),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty APP',
      theme: AppTheme.theme,
      initialRoute: RouteGenerator.home,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const HomeScreen(),
    );
  }
}
