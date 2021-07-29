import 'package:flutter/material.dart';
import '/widgets/LoginForm.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.1,
          0.4,
          0.6,
          0.9,
        ],
        colors: [
          Color(0xff23B99C),
          Color(0xff34C0B4),
          Color(0xff3FC6C3),
          Color(0xff4BCCD4),
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            iconLogoImage,
            Text("Welcome to GoHospo",
                style: TextStyle(fontSize: 30, color: Colors.white70)),
            LoginForm(),
            SizedBox(height: 20),
          ]),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

var iconLogoImage = Padding(
  padding: const EdgeInsets.fromLTRB(0, 89, 0, 30),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(100.0),
    child: Image.asset('assets/images/gohospo.png',
        width: 136, height: 136, fit: BoxFit.contain),
  ),
);