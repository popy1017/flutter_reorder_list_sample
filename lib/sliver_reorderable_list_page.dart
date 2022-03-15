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
            // ReorderableListViewと異なり、
            // 各要素を ReorderableDragStartListener または ReorderableDelayedDragStartListener
            // でラップする必要がある。
            // その影響もあり、keyを付与する対象は ReorderableDragStartListener または
            // ReorderableDragStartListenerになるので注意。
            //
            // ReorderableDragStartListenerはタップで移動が開始されるが、
            // ReorderableDelayedDragStartListenerはロングタップで移動開始となる。
            // タップで要素の移動が始まってしまうと
            // スクロールがしづらくなるので ReorderableDelayedDragStartListener のほうがいい
            itemBuilder: (_, index) => ReorderableDelayedDragStartListener(
              index: index,
              key: Key('$index'),
              child: ItemCard(items[index]),
            ),
            itemCount: items.length,
            onReorder: (int oldIndex, int newIndex) {
              _onReorder(items, oldIndex, newIndex);
            },
            proxyDecorator: (widget, _, __) {
              return Opacity(opacity: 0.5, child: widget);
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
