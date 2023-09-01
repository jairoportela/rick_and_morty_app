import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/characters/data/repositories/character_repository.dart';
import 'package:rick_and_morty_app/src/characters/providers/characters_overview_bloc.dart';

class CharacterBlocProvider extends StatelessWidget {
  const CharacterBlocProvider({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CharactersOverviewBloc(
        repository: RepositoryProvider.of<CharacterRepository>(context),
      )..add(
          const GetCharactersData(page: 1),
        ),
      child: child,
    );
  }
}
