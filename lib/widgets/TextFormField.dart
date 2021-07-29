import 'package:flutter/material.dart';

class TextFormField extends StatefulWidget {

  const TextFormField({Key? key}) : super(key: key);

  @override
  _TextFormFieldState createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<TextFormField> {
  FocusNode _focusNode = FocusNode();
  late Color color;

  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      setState(() {
        color = _focusNode.hasFocus ? Colors.black38: Colors.white;
      });
    });

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(80, 30, 80, 16),
            child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      contentPadding: EdgeInsets.fromLTRB(40, 10, 0, 10),
                      fillColor: Colors.white54,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              BorderSide(width: 0, style: BorderStyle.none)),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        letterSpacing: 3,
                        color:
                            _focusNode.hasFocus ? Colors.black38 : Colors.black38,
                      )
                  ),
                autofocus: false),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(80, 0, 80, 32),
            child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    contentPadding: EdgeInsets.fromLTRB(40, 0, 0, 10),
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      letterSpacing: 3,
                      color:
                          _focusNode.hasFocus ? Colors.black38 : Colors.black38,
                    )),
                autofocus: false),
          ),
        ],
      ),
    );
  }
}
