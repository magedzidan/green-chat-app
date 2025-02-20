import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class DatabaseSerice {
  final _fire = FirebaseFirestore.instance;
  final Logger _logger = Logger();
  Future<void> saveUser(Map<String, dynamic> userData) async {
    try {
      await _fire.collection("users").doc(userData["uid"]).set(userData);
      _logger.i('user data saved succfully');
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> loadUser(String uid) async {
    try {
      final res = await _fire.collection("users").doc(uid).get();

      if (res.data() != null) {
        _logger.i('user data fetched succfully');
        return res.data();
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }
}
