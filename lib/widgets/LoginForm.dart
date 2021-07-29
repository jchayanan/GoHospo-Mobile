import 'package:flutter/material.dart';
import '/screens/HomePage.dart';
import 'package:gohospo/model/profile.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  UserProfile profile = UserProfile();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Container(
      child: Form(
          key: formKey,
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 30, 80, 16),
              child: TextFormField(
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
                      color: Colors.black38
                    )),
                    keyboardType: TextInputType.name,
                    onSaved: (String? username) {
                      profile.username = username;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 32),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outlined),
                    contentPadding: EdgeInsets.fromLTRB(40, 10, 0, 10),
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none)),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      letterSpacing: 3,
                      color: Colors.black38
                    )),
                    obscureText: true,
                    onSaved: (String? password) {
                      profile.password = password;
                },
                keyboardType: TextInputType.name,
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 6), // Shadow position
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: Colors.red))),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red.shade600),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                    formKey.currentState?.save();
                    print(
                        "username = ${profile.username} password = ${profile.password}");
                  },
                  child: const Text('SIGN IN',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 20,),            
            FractionallySizedBox(
              widthFactor: 0.6,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 6), // Shadow position
                    ),
                  ],
                ),
                child: ElevatedButton(////////Facebook
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff1777F0)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Continue with Facebook',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            FractionallySizedBox(
              widthFactor: 0.6,
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 6), // Shadow position
                    ),
                  ],
                ),
                child: ElevatedButton(/////////Google
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff4285F4)),
                  ),
                  onPressed: () {},
                  child: const Text('Continue with Google',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: 20,),            
            Container(
              child: TextButton(
                onPressed: () {
                  print("text button pressed");
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10,),            
            Container(
              child: TextButton(
                onPressed: () {
                  print("text button pressed");
                },
                child: Text("New here? Sign Up",
                    style: TextStyle(color: Colors.white)),
                    
              ),
            ),
          ])),
    );
  }
}
