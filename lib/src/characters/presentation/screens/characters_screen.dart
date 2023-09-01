import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/characters/presentation/widgets/character_bloc_provider.dart';
import 'package:rick_and_morty_app/src/characters/presentation/widgets/characters_bloc_builder.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  static const routePath = '/characters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: const SafeArea(
        bottom: false,
        child: CharacterBlocProvider(child: CharactersInfiniteList()),
      ),
    );
  }
}
