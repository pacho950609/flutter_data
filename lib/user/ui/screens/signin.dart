import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';

class SigninScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SigninScreen();
  }
}

class _SigninScreen extends State<SigninScreen> {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return handleCurrentSession();
  }

  Widget handleCurrentSession() {
    return StreamBuilder(stream: userBloc.authStatus,builder: (BuildContext context,AsyncSnapshot snapshot) {
      if(!snapshot.hasData || snapshot.hasError) {
        return signWithGoogleUI();
      } else {
        return PlatziTripsCupertino();
      }
    });
  }

  Widget signWithGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("",null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome \n this is your travel app',
              style: TextStyle(
                fontSize: 37,
                fontFamily: 'Lato',
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              ButtonGreen(text: 'Login con google',onPressed: () => {
                userBloc.signin().then((FirebaseUser user) => print('El usuario es ${user.displayName}'))
              },height: 50,width: 300)
            ],
          )
        ],
      ),
    );
  }
}