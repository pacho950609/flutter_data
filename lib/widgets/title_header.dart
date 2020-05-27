import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  String title;
  TitleHeader({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
