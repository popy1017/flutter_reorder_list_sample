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
        itemBuilder: (_, index) => ListTile(
          key: Key('$index'),
          title: Text(items[index].name),
          trailing: const Icon(Icons.reorder),
        ),
        itemCount: items.length,
        onReorder: (int oldIndex, int newIndex) {
          _onReorder(items, oldIndex, newIndex);
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
