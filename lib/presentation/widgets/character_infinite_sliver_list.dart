import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rnm_t/domain/entities/character/character.dart';
import 'package:rnm_t/presentation/blocs/character/character_bloc.dart';
import 'package:rnm_t/utils/logger.dart';

import 'character_short_card.dart';

class CharacterInfiniteSliverList extends StatefulWidget {
  const CharacterInfiniteSliverList({Key? key}) : super(key: key);

  @override
  State<CharacterInfiniteSliverList> createState() =>
      _CharacterInfiniteSliverListState();
}

class _CharacterInfiniteSliverListState
    extends State<CharacterInfiniteSliverList> {
  late final CharacterBloc _bloc;

  final PagingController<int, Character> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _bloc = context.read<CharacterBloc>();

    _pagingController.addPageRequestListener((pageKey) {
      _bloc.add(const GetCharacters());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharacterBloc, CharacterState>(
      listenWhen: (prev, curr) {
        if (prev.search != curr.search) {
          _pagingController.refresh();
        }
        return true;
      },
      listener: (context, state) {
        _pagingController.value = PagingState(
          nextPageKey: state.nextPageKey,
          error: state.error,
          itemList: state.items,
        );
      },
      child: BlocBuilder<CharacterBloc, CharacterState>(builder: (_, state) {
        return PagedSliverList<int, Character>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (BuildContext context, item, int index) {
              return CharacterShortCard(
                item: item,
              );
            },
            firstPageErrorIndicatorBuilder: (context) {
              return Container(
                height: 200,
                width: 299,
                color: Colors.black,
              );
            },
            newPageErrorIndicatorBuilder: (context) {
              logger.w('build');

              return Container(
                height: 200,
                width: 299,
                color: Colors.black,
              );
            },
            animateTransitions: true,
          ),
        );
      }),
    );
  }
}
