import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignin = GoogleSignIn();
  final FacebookLogin facebookSignin = FacebookLogin();

  Future<FirebaseUser> signin() async {
    GoogleSignInAccount googleAccount = await googleSignin.signIn();
    GoogleSignInAuthentication gSa = await googleAccount.authentication;

    FirebaseUser user = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            idToken: gSa.idToken, accessToken: gSa.accessToken));
    return user;
  }

  Future<FirebaseUser> signinFacebook() async {
    var result = await facebookSignin.logIn(['email']);
    print(result.status.toString());
    if (result.status == FacebookLoginStatus.loggedIn) {
      FirebaseUser user = await _auth.signInWithCredential(
          FacebookAuthProvider.getCredential(
              accessToken: result.accessToken.token));
      return user;
    }
  }

  Future<void> signout() async {
    await _auth.signOut().then((value) => print('Sesion cerrada'));
    await googleSignin.signOut();
    print('Sesiones cerradas');
  }
}
