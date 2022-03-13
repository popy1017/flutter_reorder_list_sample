import 'package:flutter/material.dart';

class Item {
  Item(this.name);
  final String name;
}

class ItemCard extends StatelessWidget {
  const ItemCard(this.item, {Key? key}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: key,
      child: ListTile(
        title: Text(item.name),
        trailing: const Icon(Icons.reorder),
      ),
    );
  }
}
