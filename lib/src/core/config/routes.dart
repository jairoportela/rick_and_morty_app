import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/presentation/screens/characters_screen.dart';
import 'package:rick_and_morty_app/src/episodes/presentation/screens/episodes_screen.dart';
import 'package:rick_and_morty_app/src/home/home_screen.dart';
import 'package:rick_and_morty_app/src/locations/presentation/screens/locations_screen.dart';

class RouteGenerator {
  static const home = HomeScreen.routePath;
  static const charactersScreen = CharactersScreen.routePath;
  static const episodesScreen = EpisodesScreen.routePath;
  static const locationsScreen = LocationsScreen.routePath;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute<HomeScreen>(
          builder: (_) => const HomeScreen(),
        );
      case charactersScreen:
        return MaterialPageRoute<CharactersScreen>(
          builder: (_) => const CharactersScreen(),
        );
      case episodesScreen:
        return MaterialPageRoute<EpisodesScreen>(
          builder: (_) => const EpisodesScreen(),
        );
      case locationsScreen:
        return MaterialPageRoute<LocationsScreen>(
          builder: (_) => const LocationsScreen(),
        );
      default:
        return MaterialPageRoute<HomeScreen>(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}

enum ScreensTitles {
  characters('Characters'),
  episodes('Episodes'),
  locations('Locations');

  const ScreensTitles(this.title);
  final String title;
}
