import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/presentation/screens/characters_screen.dart';
import 'package:rick_and_morty_app/src/home/home_screen.dart';

class RouteGenerator {
  static const home = HomeScreen.routePath;
  static const charactersScreen = CharactersScreen.routePath;

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
      default:
        return MaterialPageRoute<HomeScreen>(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
