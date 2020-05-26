import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class CloudFirestoreApi {

  final String USERS = 'users';
  final String PLACES = 'places';
  final Firestore _db = Firestore.instance;

  void updateUser (User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignin': DateTime.now()
    },merge: true);
  }


}