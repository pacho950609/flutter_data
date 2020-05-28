import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/place/model/place.dart';
import 'package:platzi_trips_app/user/repository/auth_repository.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_repository.dart';

import '../model/user.dart';

class UserBloc implements Bloc {

  final _authRepository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> signin() {
    return _authRepository.signinFirebase();
  }

  void signOut() {
    _authRepository.signOut();
  }

  updateUser(User user) {
    _cloudFirestoreRepository.updateUserFirestore(user);
  }

  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}