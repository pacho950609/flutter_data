import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_api.dart';

import '../model/user.dart';


class CloudFirestoreRepository {
  final _cloudFirestoreApi = new CloudFirestoreApi();

  void updateUserFirestore (User user) => _cloudFirestoreApi.updateUser(user);
}