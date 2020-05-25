import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/repository/auth_repository.dart';

class UserBloc implements Bloc {

  final _authRepository = AuthRepository();

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> signin() {
    _authRepository.signinFirebase();
  }

  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}