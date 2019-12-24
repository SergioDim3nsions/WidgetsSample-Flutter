import 'package:flutter/services.dart' show rootBundle;


class _ProviderMenu {
  List<dynamic> options = [];

  _ProviderMenu() {
    loadData();
  }

  loadData() {
    rootBundle.loadString('assets/menu_opts.json')
        .then((data) {
      print(data);
    });
  }

}

final providerMenu = _ProviderMenu();