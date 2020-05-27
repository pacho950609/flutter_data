import 'dart:io';
import 'package:flutter/material.dart';
import 'package:platzi_trips_app/place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/place/ui/widgets/input_location.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_input.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;
  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final controllerTitleText = TextEditingController();
    final controllerDescriptionText = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack("", 300),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 25, left: 5),
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45,
                    ),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 45, left: 20, right: 10),
                  child: TitleHeader(title: 'Add a new place'),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120, bottom: 20),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImage(pathImage: "assets/img/mountain.jpeg",inconData: Icons.camera_alt, width: 300,height: 200,left: 0,),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, top:20),
                  child: TextInput(
                    controller: controllerTitleText,
                    hintText: 'Title',
                    inputType: null,
                  ),
                ),
                TextInput(
                  controller: controllerDescriptionText,
                  hintText: 'Title',
                  inputType: TextInputType.multiline,
                  maxLine: 4,
                ),
                Container(
                  margin: EdgeInsets.only(top:20),
                  child: InputLocation(hintText: 'add Location',iconDate: Icons.location_on,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
