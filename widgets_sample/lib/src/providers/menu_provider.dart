import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

final providerMenu = _ProviderMenu();

class _ProviderMenu {
  List<dynamic> options;

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('assets/menu_opts.json');
    Map dataMap = json.decode(response);
    options = dataMap['routes'];
    return options;
  }
}
