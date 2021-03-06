import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../item.dart';
import '../main.dart';

class ReorderableGridViewPage extends ConsumerWidget {
  const ReorderableGridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ReorderableGridView.builder(
        itemBuilder: (_, index) => ItemCard(
          items[index],
          key: Key('$index'), // 各要素にユニークなKeyをつける必要がある
        ),
        itemCount: items.length,
        onReorder: (int oldIndex, int newIndex) =>
            _onReorder(items, oldIndex, newIndex),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: kIsWeb ? 4 : 2,
        ),
      ),
    );
  }

  void _onReorder(List<Item> items, int oldIndex, int newIndex) {
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
  }
}
