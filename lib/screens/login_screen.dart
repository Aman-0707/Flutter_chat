import 'package:chat_flutter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_flutter/Rounded_button.dart';
import 'package:chat_flutter/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id ='Login Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
 dynamic email;
dynamic password;
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
                email=value;
              },
              decoration: kdecoration.copyWith(
                hintText: 'Enter Your Email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kdecoration.copyWith(hintText: 'Enter Password',),
            ),
            SizedBox(
              height: 24.0,
            ),
          RoundedButton(color: Colors.lightBlueAccent, title: 'Log IN', 
          onPressed: ()async{
            try{
            final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
            if(user != null){
              Navigator.pushNamed(context, ChatScreen.id);
            }}
            catch(e){
              print(e);
            }
          })
          ],
        ),
      ),
    );
  }
}
