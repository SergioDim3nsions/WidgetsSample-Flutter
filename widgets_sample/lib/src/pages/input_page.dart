import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<InputPage> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _date = "";
  String _selectedOption = "Value 1";
  List<String> _valuesList = ['Value 1', 'Value 2', 'Value 3'];
  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      //  autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          icon: Icon(Icons.account_circle),
          suffixIcon: Icon(Icons.accessibility),
          helperText: 'Only set the name',
          labelText: 'Name',
          hintText: 'Name',
          counter: Text('Words ${_name.length}')),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('The name is: $_name'),
      subtitle: Text('This is the $_email'),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
        labelText: 'Email',
        hintText: 'Email',
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.lock_open),
        labelText: 'Password',
        hintText: 'Password',
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.perm_contact_calendar),
        labelText: 'Birth date',
        hintText: 'Birth date',
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        locale: Locale('es', 'ES'),
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> menuOptions = List();
    _valuesList.forEach((value) {
      menuOptions.add(DropdownMenuItem(
        child: Text(value),
        value: value,
      ));
    });
    return menuOptions;
  }

  Widget _createDropdown() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      Expanded(
        child: DropdownButton(
          value: _selectedOption,
          items: getOptionsDropdown(),
          onChanged: (opt) {
            print(opt);
            setState(() {
              _selectedOption = opt;
            });
          },
        ),
      )
    ]);
  }
}
