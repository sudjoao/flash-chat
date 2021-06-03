import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/logo.dart';
import 'package:flash_chat/components/sign_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "wecolme_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    startAnimation();
    super.initState();
  }

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
            Transform.translate(
              offset: Offset(controller.value * 360 - 360, 0),
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: MyLogo(
                      height: 60,
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                      child: AnimatedTextKit(
                        totalRepeatCount: 5,
                        pause: Duration(seconds: 1),
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Flash Chat',
                            speed: Duration(milliseconds: 90),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            Transform.translate(
              offset: Offset(360 - controller.value * 360, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MySignButton(
                    backgroundColor: Colors.lightBlueAccent,
                    text: 'Log In',
                    onPress: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                  MySignButton(
                    backgroundColor: Colors.blueAccent,
                    text: 'Register',
                    onPress: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startAnimation() {
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }
}
