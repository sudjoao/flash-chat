import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/logo.dart';
import 'package:flash_chat/components/sign_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool isLoading = false;
  void login() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userInfo = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userInfo != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: MyLogo(
                  height: 200,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter your e-mail',
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
                decoration: kInputDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              MySignButton(
                backgroundColor: Colors.lightBlueAccent,
                text: 'Log In',
                onPress: () {
                  login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
