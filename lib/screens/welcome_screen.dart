import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
import 'package:chat_flutter/Rounded_button.dart';




class WelcomeScreen extends StatefulWidget {
  static const String id ='welcome screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),



            RoundedButton(color: Colors.lightBlueAccent,title: 'Login IN', onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },),


            RoundedButton(color: Colors.lightBlueAccent, title: 'Sign IN', onPressed:  () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },)
          ],
        ),
      ),
    );
  }
}

