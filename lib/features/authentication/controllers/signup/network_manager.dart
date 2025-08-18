import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:d_store/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // needed for PlatformException
import 'package:get/get.dart';

// manages the network connectivity status and provides methods to chek and handle connectivity changes
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  // Expose the current connection status publicly
  ConnectivityResult get connectionStatus => _connectionStatus.value;

  // Initialize the network manager and set up a stream to continually check the connection status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus as void Function(List<ConnectivityResult> event)?,
    );
  }

  // Update the connectivity result whenever the connection changes
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      // Show a warning snackbar if there is no internet connectivity
      TLoaders.warningSnackBar(title: 'No Internet Connectivity');
    }
  }

  // Check the internet connection status
  // return true if connected and false if not
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false;
    }
  }

  // Cancel the subscription when the controller is disposed to prevent memory leaks
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
