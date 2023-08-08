import 'package:chat_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/Rounded_button.dart';
import 'package:chat_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'Registration Screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String Email;
  late String Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                Email = value;
              },
              decoration: kdecoration.copyWith(
                hintText: 'Enter your Email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                Password = value;
              },
              decoration: kdecoration.copyWith(hintText: 'Enter Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                color: Colors.blueAccent,
                title: 'Register',
                onPressed: () async {
                  try {
                    final NewUser = await _auth.createUserWithEmailAndPassword(
                        email: Email, password: Password);
                        if (NewUser !=null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  } 
                  }
                  catch (e) {
                    print(e);
                  }
                  
                },
                )
          ],
        ),
      ),
    );
  }
}
