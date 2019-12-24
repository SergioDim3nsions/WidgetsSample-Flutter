import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: ListView(children: _createItemsShort()),
    ));
  }

  List<Widget> _createItems() {
    List<Widget> widgetList = List<Widget>();
    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      widgetList..add(tempWidget)..add(Divider());
    }

    return widgetList;
  }

  List<Widget> _createItemsShort() {
    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('yeah'),
            leading: Icon(Icons.favorite),
            trailing: Icon(Icons.exposure),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
