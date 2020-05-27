import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage(
              pathImage: "assets/img/mountain.jpeg",
              inconData: Icons.favorite_border,
              width: 300,
              height: 230,
              left: 20,),
          CardImage(
              pathImage: "assets/img/mountain_stars.jpeg",
              inconData: Icons.favorite_border,
              width: 300,
              height: 230,
              left: 20),
          CardImage(
              pathImage: "assets/img/river.jpeg",
              inconData: Icons.favorite_border,
              width: 300,
              height: 230,
              left: 20),
          CardImage(
              pathImage: "assets/img/sunset.jpeg",
              inconData: Icons.favorite_border,
              width: 300,
              height: 230,
              left: 20),
        ],
      ),
    );
  }
}
