import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_store/data/user/user_model.dart';
import 'package:d_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:d_store/utils/exceptions/format_exception.dart';
import 'package:d_store/utils/exceptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// Repository class fot user related operations
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
  // Function to fetch user details based on used id

  // Function to Update Used data in Firestore

  // Update any field in specific users collection
}
