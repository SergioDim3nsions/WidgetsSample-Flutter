import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/avatar-1568384338.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/avatar-1568384338.jpg')),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
    );
  }
}
