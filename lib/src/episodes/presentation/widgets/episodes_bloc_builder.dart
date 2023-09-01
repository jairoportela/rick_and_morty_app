import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/loading_indicator.dart';
import 'package:rick_and_morty_app/src/core/utils/status_enum.dart';
import 'package:rick_and_morty_app/src/episodes/domain/models/episode.dart';
import 'package:rick_and_morty_app/src/episodes/presentation/widgets/episodes_list_item.dart';
import 'package:rick_and_morty_app/src/episodes/providers/episodes_overview_bloc.dart';

class EpisodesInfiniteList extends StatefulWidget {
  const EpisodesInfiniteList({super.key});

  @override
  State<EpisodesInfiniteList> createState() => _EpisodesInfiniteListState();
}

class _EpisodesInfiniteListState extends State<EpisodesInfiniteList> {
  late StreamSubscription _blocListingStateSubscription;
  final PagingController<int, Episode> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      context.read<EpisodesOverviewBloc>().add(
            GetEpisodesData(page: pageKey),
          );
    });
    _blocListingStateSubscription =
        context.read<EpisodesOverviewBloc>().stream.listen((listingState) {
      _pagingController.value = PagingState(
        nextPageKey: listingState.hasMore ? listingState.nextPage : null,
        error: listingState.status == RequestStatus.failed
            ? listingState.error
            : null,
        itemList: listingState.items.isEmpty ? null : listingState.items,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView<int, Episode>.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Episode>(
          itemBuilder: (context, item, index) => EpisodeListItem(
            name: item.name,
            episodeCode: item.episode,
            id: item.id.toString(),
          ),
          newPageProgressIndicatorBuilder: (context) =>
              const LoadingIndicator(),
          firstPageProgressIndicatorBuilder: (context) =>
              const LoadingIndicator(),
          firstPageErrorIndicatorBuilder: (context) => const Center(
            child: Text("It's not possible to show the episodes."),
          ),
          animateTransitions: true,
          newPageErrorIndicatorBuilder: (context) => GestureDetector(
            onTap: () => _pagingController.retryLastFailedRequest(),
            child: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'An error ocurrs, please try again.',
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.refresh,
                  ),
                ],
              ),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Text('Empty episodes.'),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _blocListingStateSubscription.cancel();
    super.dispose();
  }
}
