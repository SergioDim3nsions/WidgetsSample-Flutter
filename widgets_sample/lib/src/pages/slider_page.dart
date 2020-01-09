import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;
  bool _blockImage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sliders'),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _clearSlider(),
              _createCheckBox(),
              _createSwitch(),
              Expanded(child: _createImage())
            ],
          ),
        ),
      ),
    );
  }

  Widget _clearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Screen size',
      // divisions: 20,
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_blockImage)
          ? null
          : (double value) {
              setState(() {
                _valueSlider = value;
              });

              print(value);
            },
    );
  }

  Widget _createImage() {
    return Image(
        width: _valueSlider,
        fit: BoxFit.contain,
        image: NetworkImage(
            'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/201812/20/00183180506137____1__640x640.jpg'));
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
      title: Text('Enable / Disable Slider'),
      value: _blockImage,
      onChanged: (value) {
        setState(() {
          _blockImage = value;
        });
      },
    );
  }

  Widget _createSwitch() {
    return SwitchListTile(
      title: Text('Enable / Disable Switch'),
      value: _blockImage,
      onChanged: (value) {
        setState(() {
          _blockImage = value;
        });
      },
    );
  }
}
