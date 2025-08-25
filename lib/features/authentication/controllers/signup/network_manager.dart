import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:d_store/utils/popups/loaders.dart';
import 'package:flutter/services.dart'; // For PlatformException
import 'package:get/get.dart';

/// Manages the network connectivity status and provides methods
/// to check and handle connectivity changes across the app.
class NetworkManager extends GetxController {
  /// Singleton instance (accessible via `NetworkManager.instance`)
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();

  /// Subscription to listen for connectivity changes
  late final StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  /// Holds the current connection status (reactive)
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Public getter for the current connection status
  ConnectivityResult get connectionStatus => _connectionStatus.value;

  /// Initialize the manager and start listening for connectivity changes.
  @override
  void onInit() {
    super.onInit();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      // API returns a list of active connections (WiFi + Mobile, etc.)
      final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
      _updateConnectionStatus(result);
    });
  }

  /// Update the connectivity state and handle UI feedback if needed.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;

    if (result == ConnectivityResult.none) {
      // Show a warning snackbar if there is no internet connectivity
      TLoaders.warningSnackBar(title: 'No Internet Connectivity');
    }
  }

  /// Manually check internet connection once.
  /// Returns `true` if connected, `false` otherwise.
  Future<bool> isConnected() async {
    try {
      final results = await _connectivity.checkConnectivity();
      // In v6, this also returns a list of ConnectivityResult
      final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
      return result != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Cancel subscription when controller is disposed (prevents memory leaks).
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
