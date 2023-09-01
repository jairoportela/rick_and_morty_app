import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rick_and_morty_app/src/characters/domain/models/character.dart';
import 'package:rick_and_morty_app/src/characters/presentation/widgets/character_list_item.dart';
import 'package:rick_and_morty_app/src/characters/providers/characters_overview_bloc.dart';
import 'package:rick_and_morty_app/src/core/presentation/widgets/loading_indicator.dart';
import 'package:rick_and_morty_app/src/core/utils/status_enum.dart';

class CharactersInfiniteList extends StatefulWidget {
  const CharactersInfiniteList({super.key});

  @override
  State<CharactersInfiniteList> createState() => _CharactersInfiniteListState();
}

class _CharactersInfiniteListState extends State<CharactersInfiniteList> {
  late StreamSubscription _blocListingStateSubscription;
  final PagingController<int, Character> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      context.read<CharactersOverviewBloc>().add(
            GetCharactersData(page: pageKey),
          );
    });
    _blocListingStateSubscription =
        context.read<CharactersOverviewBloc>().stream.listen((listingState) {
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
      child: PagedGridView<int, Character>(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Character>(
          itemBuilder: (context, item, index) => CharacterGridItem(
            imageUrl: item.image,
            name: item.name,
            status: item.status,
            id: item.id.toString(),
          ),
          newPageProgressIndicatorBuilder: (context) =>
              const LoadingIndicator(),
          firstPageProgressIndicatorBuilder: (context) =>
              const LoadingIndicator(),
          firstPageErrorIndicatorBuilder: (context) => const Center(
            child: Text("It's not possible to show the characters."),
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
            child: Text('Empty characters.'),
          ),
        ),
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
