import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character_filter.dart';
import 'package:rick_and_morty_app/src/characters/presentation/widgets/character_bloc_provider.dart';
import 'package:rick_and_morty_app/src/characters/presentation/widgets/characters_bloc_builder.dart';
import 'package:rick_and_morty_app/src/characters/presentation/widgets/characters_filters_modal.dart';
import 'package:rick_and_morty_app/src/characters/providers/characters_overview_bloc.dart';
import 'package:rick_and_morty_app/src/core/config/routes.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});
  static const routePath = '/characters';

  @override
  Widget build(BuildContext context) {
    return const CharacterBlocProvider(child: CharactersScreenBuilder());
  }
}

class CharactersScreenBuilder extends StatelessWidget {
  const CharactersScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ScreensTitles.characters.title),
        actions: [
          IconButton(
              onPressed: () async {
                final result = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (ctx) {
                      return CharactersFilterModal(
                        initialFilters: context
                            .read<CharactersOverviewBloc>()
                            .state
                            .filters,
                      );
                    });
                if (!context.mounted) return;
                if (result != null && result is CharacterFilters) {
                  context.read<CharactersOverviewBloc>().add(
                        GetCharactersData(page: 1, filters: result),
                      );
                }
              },
              icon: const Icon(
                Icons.filter_alt,
              ))
        ],
      ),
      body: const SafeArea(
        bottom: false,
        child: CharactersInfiniteList(),
      ),
    );
  }
}
