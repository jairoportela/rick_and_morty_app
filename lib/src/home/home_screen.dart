import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/presentation/screens/characters_screen.dart';

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
          ],
        ),
      ),
    );
  }
}
