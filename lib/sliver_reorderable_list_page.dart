import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item.dart';
import 'main.dart';

class SliverReorderableListPage extends ConsumerWidget {
  const SliverReorderableListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          SliverReorderableList(
            itemBuilder: (_, index) => ReorderableDelayedDragStartListener(
              index: index,
              key: Key('$index'),
              child: ItemCard(items[index]),
            ),
            itemCount: items.length,
            onReorder: (int oldIndex, int newIndex) {
              _onReorder(items, oldIndex, newIndex);
            },
          ),
        ],
      ),
    );
  }

  void _onReorder(List<Item> items, int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    items.insert(newIndex, items.removeAt(oldIndex));
  }
}
