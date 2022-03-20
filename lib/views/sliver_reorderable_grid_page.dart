import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../item.dart';
import '../main.dart';

class SliverReorderableGridPage extends ConsumerWidget {
  const SliverReorderableGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          SliverReorderableGrid(
            // SliverReorderableListと同様、こちらも各要素を
            // ReorderableGridDragStartListener または ReorderableGridDelayedDragStartListenerで
            // ラップする必要がある。
            itemBuilder: (_, index) => ReorderableGridDelayedDragStartListener(
              index: index,
              key: Key('$index'),
              child: ItemCard(
                items[index],
                key: Key('$index'), // 各要素にユニークなKeyをつける必要がある
              ),
            ),
            itemCount: items.length,
            onReorder: (int oldIndex, int newIndex) =>
                _onReorder(items, oldIndex, newIndex),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: kIsWeb ? 4 : 2,
            ),
            proxyDecorator: (widget, _, __) {
              return Opacity(opacity: 0.5, child: widget);
            },
          ),
        ],
      ),
    );
  }

  void _onReorder(List<Item> items, int oldIndex, int newIndex) {
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
  }
}
