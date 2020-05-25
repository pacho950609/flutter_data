import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignin = GoogleSignIn();

  Future<FirebaseUser> signin() async {
    GoogleSignInAccount googleAccount = await googleSignin.signIn();
    GoogleSignInAuthentication gSa = await googleAccount.authentication;

    FirebaseUser user = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            idToken: gSa.idToken, accessToken: gSa.accessToken));
    return user;
  }

  Future<void> signout() async {
    await _auth.signOut().then((value) => print('Sesion cerrada'));
    await googleSignin.signOut();
    print('Sesiones cerradas');
  }
}
