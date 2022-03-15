import 'package:flutter/material.dart';
import 'reordable_list_view_page.dart';
import 'reorderable_grid_view_sample.dart';
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
            title: const Text('ReorderableListView'),
            onTap: () {
              _moveTo(context, const ReorderableListViewPage());
            },
          ),
          ListTile(
            title: const Text('SliverReorderableList'),
            onTap: () {
              _moveTo(context, const SliverReorderableListPage());
            },
          ),
          ListTile(
            title: const Text('ReorderableGridViewSample'),
            onTap: () {
              _moveTo(context, const ReorderableGridViewSample());
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