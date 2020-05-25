import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/user/repository/firebase_auth_api.dart';

class AuthRepository {

  final _firebaseAuthApi = FirebaseAuthApi();
  Future<FirebaseUser> signinFirebase() => _firebaseAuthApi.signin();
  signOut() => _firebaseAuthApi.signout();

}
