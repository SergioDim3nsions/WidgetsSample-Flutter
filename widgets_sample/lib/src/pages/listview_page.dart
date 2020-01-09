import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = ScrollController();
  List<int> _listNumber = List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addTenImages();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_addTenImages();
        if (!_isLoading) {
          _fetchData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: Stack(
          children: <Widget>[_createList(), _createLoading()],
        ),
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _pullToRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumber.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listNumber[index];

          return FadeInImage(
            height: 300.0,
            fit: BoxFit.fitHeight,
            image: NetworkImage('https://picsum.photos/id/$image/500/300'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future<Null> _pullToRefresh() async {
    final duration = Duration(milliseconds: 2000);
    new Timer(duration, () {
      _listNumber.clear();
      _lastItem++;
      _addTenImages();
    });

    return Future.delayed(duration);
  }

  _addTenImages() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _listNumber.add(_lastItem);
    }

    setState(() {});
  }

  Future _fetchData() async {
    setState(() {
      _isLoading = true;

      final duration = Duration(seconds: 2);
      return new Timer(duration, responseHttp);
    });
  }

  void responseHttp() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(microseconds: 250));
    _addTenImages();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 25.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
