import 'package:flutter/material.dart';
import 'package:widgets_sample/src/providers/menu_provider.dart';

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

  ListView _createList() {

    print(providerMenu.options);

    return ListView(
      children: _createItemList(),
    );
  }

  List<Widget> _createItemList() {
  return[];
  }
}
