import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/place/model/place.dart';

import '../model/user.dart';

class CloudFirestoreApi {
  final String USERS = 'users';
  final String PLACES = 'places';
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUser(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignin': DateTime.now()
    }, merge: true);
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    String uid = (await _auth.currentUser()).uid;
    DocumentReference _userRef = _db.collection(USERS).document(uid);
    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _userRef
    });
  }
}
