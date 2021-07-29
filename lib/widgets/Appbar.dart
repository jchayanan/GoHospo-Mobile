import 'package:flutter/material.dart';

class MyAppbar extends StatefulWidget {
  @override
  _MyAppbarState createState() => _MyAppbarState();
  
}

TextEditingController appBarSearchController = TextEditingController();

class _MyAppbarState extends State<MyAppbar> {
  Widget cusSearchBar = Text("App");
  Icon cusIcon = Icon(Icons.accessibility);
  AssetImage th = AssetImage("assets/images/icon/thai.png");
  int langstate = 0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Container(
          height: 30,
          child: TextFormField(
            controller: appBarSearchController,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.only(
                left: 15,
              ),
              suffixIcon: IconButton(
                padding: EdgeInsets.only(bottom: 1),
                iconSize: 25,
                icon: Icon(Icons.search),
                onPressed: () {
                  print(appBarSearchController.toString());
                },
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none)),
              hintText: 'ค้นหาโรค, โรงพยาบาล หรือ คลินิก',
              hintStyle: TextStyle(
                letterSpacing: 1,
                fontSize: 12,
                color: Colors.black26,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (langstate == 0) {
                  th = AssetImage("assets/images/icon/english.png");
                  langstate = 1;
                } else {
                  th = AssetImage("assets/images/icon/thai.png");
                  langstate = 0;
                }
              });
            },
            icon: ImageIcon(
              th,
              size: 27,
            ),
          ),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
        ],
      );
  }
}