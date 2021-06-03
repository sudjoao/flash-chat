import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  final double height;
  MyLogo({this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/logo.png'),
      height: height,
    );
  }
}
