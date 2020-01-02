import 'package:flutter/material.dart';
import 'package:widgets_sample/src/providers/menu_provider.dart';
import 'package:widgets_sample/src/utils/icons_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets Sample'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return FutureBuilder(
      future: providerMenu.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createItemList(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _createItemList(List<dynamic> data, BuildContext context) {

    final List<Widget> options = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['text']),
        leading: getIcon(opt['icon']),
        onTap: () {
          Navigator.pushNamed(context, opt['route']);

          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });
    return options;
  }

  _onItemClick(BuildContext context) {}
}
