import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  String hintText;
  TextInputType inputType;
  TextEditingController controller;
  int maxLine = 1;

  TextInput(
      {Key key,
      @required this.hintText,
      @required this.inputType,
      @required this.controller,
      this.maxLine});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLine,
        style: TextStyle(
            fontSize: 15,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFe5e5e5)),
              borderRadius: BorderRadius.all(Radius.circular(9))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFe5e5e5)),
              borderRadius: BorderRadius.all(Radius.circular(9))),
        ),
      ),
    );
  }
}
