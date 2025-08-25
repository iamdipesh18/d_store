// general_bindings.dart
import 'package:d_store/features/authentication/controllers/signup/network_manager.dart';
import 'package:d_store/data/repositories/authentication_repositories/authentication_repository.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager(), permanent: true);
    Get.put(AuthenticationRepository(), permanent: true);
  }
}
