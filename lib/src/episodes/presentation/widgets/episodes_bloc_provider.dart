import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/src/episodes/data/repositories/episode_repository.dart';
import 'package:rick_and_morty_app/src/episodes/providers/episodes_overview_bloc.dart';

class EpisodesBlocProvider extends StatelessWidget {
  const EpisodesBlocProvider({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => EpisodesOverviewBloc(
        repository: RepositoryProvider.of<EpisodeRepository>(context),
      )..add(
          const GetEpisodesData(page: 1),
        ),
      child: child,
    );
  }
}
