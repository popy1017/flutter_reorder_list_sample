import 'package:flutter/material.dart';
import 'package:flutter_reorder_list_sample/views/sliver_reorderable_grid_page.dart';
import 'reorderable_list_view_page.dart';
import 'reorderable_grid_view_page.dart';
import 'sliver_reorderable_list_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'ReorderableListView',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ListTile(
            title: const Text('通常版'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              _moveTo(context, const ReorderableListViewPage());
            },
          ),
          ListTile(
            title: const Text('Sliver版'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              _moveTo(context, const SliverReorderableListPage());
            },
          ),
          ListTile(
            title: Text(
              'ReorderableGridView',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          ListTile(
            title: const Text('通常版'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              _moveTo(context, const ReorderableGridViewPage());
            },
          ),
          ListTile(
            title: const Text('Sliver版'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              _moveTo(context, const SliverReorderableGridPage());
            },
          ),
        ],
      ),
    );
  }

  void _moveTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  }
}
