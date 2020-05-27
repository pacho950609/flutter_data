import 'package:flutter/material.dart';

class InputLocation extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  IconData iconDate;

  InputLocation(
      {Key key,
      @required this.hintText,
      @required this.controller,
      @required this.iconDate});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Icon(iconDate),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)]));
  }
}
