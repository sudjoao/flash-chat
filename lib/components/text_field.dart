import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final Function onChange;
  MyTextField({this.hintText, this.borderColor, this.onChange});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange(),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
