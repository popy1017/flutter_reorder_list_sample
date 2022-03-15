import 'dart:math';

import 'package:flutter/material.dart';

class Item {
  Item(this.name);
  final String name;
  final Color color = Colors
      .primaries[Random().nextInt(Colors.primaries.length)]
      .withOpacity(0.1);
}

class ItemTile extends StatelessWidget {
  const ItemTile(this.item, {Key? key}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      child: ListTile(
        title: Text(item.name),
        trailing: const Icon(Icons.reorder),
        tileColor: item.color,
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard(this.item, {Key? key}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      child: Container(
        // Card に color フィールドがあるが、item.colorにopacityを設定していて、
        // 透過してしまうため Containerに色をつける
        color: item.color,
        child: Center(
          child: Text(item.name),
        ),
      ),
    );
  }
}
