import 'package:d_store/data/user/user_model.dart';
import 'package:d_store/data/user/user_repository.dart';
import 'package:d_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// -- Save User Record From any Registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert name to first name and last name
        final nameParts = UserModel.nameParts(
          userCredentials.user!.displayName ?? "",
        );
        final username = UserModel.generateUsername(
          userCredentials.user!.displayName ?? "",
        );

        // Map the data to the user model
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts.isNotEmpty ? nameParts[0] : '',
          lastName: nameParts.length > 1 ? nameParts[1] : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );
        // Save the user data to Firestore
        await UserRepository().saveUserRecord(user);
      }
    } catch (e) {
      // Handle any errors that may occur during saving user record
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            "Something went wrong while saving your information. You can re-save it from the profile section.",
      );
    }
  }
}
