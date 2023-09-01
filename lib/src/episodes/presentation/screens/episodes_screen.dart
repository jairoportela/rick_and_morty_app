import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/core/config/routes.dart';
import 'package:rick_and_morty_app/src/episodes/domain/models/episodes_filter.dart';
import 'package:rick_and_morty_app/src/episodes/presentation/widgets/episodes_bloc_builder.dart';
import 'package:rick_and_morty_app/src/episodes/presentation/widgets/episodes_bloc_provider.dart';
import 'package:rick_and_morty_app/src/episodes/presentation/widgets/episodes_filters_modal.dart';
import 'package:rick_and_morty_app/src/episodes/providers/episodes_overview_bloc.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});
  static const routePath = '/episodes';

  @override
  Widget build(BuildContext context) {
    return const EpisodesBlocProvider(child: EpisodesScreenBuilder());
  }
}

class EpisodesScreenBuilder extends StatelessWidget {
  const EpisodesScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ScreensTitles.episodes.title),
        actions: [
          IconButton(
              onPressed: () async {
                final result = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (ctx) {
                      return EpisodesFilterModal(
                        initialFilters:
                            context.read<EpisodesOverviewBloc>().state.filters,
                      );
                    });
                if (!context.mounted) return;
                if (result != null && result is EpisodesFilters) {
                  context.read<EpisodesOverviewBloc>().add(
                        GetEpisodesData(page: 1, filters: result),
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
        child: EpisodesInfiniteList(),
      ),
    );
  }
}
