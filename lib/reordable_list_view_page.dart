import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item.dart';
import 'main.dart';

class ReorderableListViewPage extends ConsumerWidget {
  const ReorderableListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView.builder(
        itemBuilder: (_, index) => ItemCard(
          items[index],
          key: Key('$index'), // 各要素にユニークなKeyをつける必要がある
        ),
        itemCount: items.length,
        onReorder: (int oldIndex, int newIndex) {
          _onReorder(items, oldIndex, newIndex);
        },
        proxyDecorator: (widget, _, __) {
          return Opacity(opacity: 0.5, child: widget);
        },
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
