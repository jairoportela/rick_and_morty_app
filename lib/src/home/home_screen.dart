import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/presentation/screens/characters_screen.dart';
import 'package:rick_and_morty_app/src/episodes/presentation/screens/episodes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
                title: const Text('Characters'),
                onTap: () {
                  Navigator.of(context).pushNamed(CharactersScreen.routePath);
                }),
            ListTile(
                title: const Text('Episodes'),
                onTap: () {
                  Navigator.of(context).pushNamed(EpisodesScreen.routePath);
                }),
          ],
        ),
      ),
    );
  }
}
