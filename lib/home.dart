import 'package:flutter/material.dart';
import 'package:flutter_reorder_list_sample/reordable_list_view_page.dart';

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
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _moveTo(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  }
}