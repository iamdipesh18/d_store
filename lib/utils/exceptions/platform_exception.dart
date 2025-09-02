
/// Handles errors from platform channels (iOS/Android native side).
class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      // 🔹 General Channel Errors
      case "channel-error":
        return "A platform channel error occurred. Please try again.";
      case "missing-plugin":
        return "This feature is not supported on the current platform.";
      case "unavailable":
        return "The requested platform service is unavailable.";
      case "not-implemented":
        return "This feature has not been implemented on the platform.";
      case "unknown":
        return "An unknown platform error occurred.";

      // 🔹 Permissions & Security
      case "permission-denied":
        return "Permission was denied for the requested platform feature.";
      case "permission-restricted":
        return "This permission is restricted and cannot be granted.";
      case "location-permission-denied":
        return "Location permission is denied. Please enable it in settings.";
      case "camera-permission-denied":
        return "Camera permission is denied. Please enable it in settings.";
      case "storage-permission-denied":
        return "Storage permission is denied. Please allow access.";
      case "bluetooth-permission-denied":
        return "Bluetooth permission is denied. Enable it to continue.";
      case "microphone-permission-denied":
        return "Microphone permission is denied. Please allow access.";

      // 🔹 Device Features
      case "camera-unavailable":
        return "The camera is not available on this device.";
      case "camera-in-use":
        return "The camera is currently in use by another application.";
      case "sensor-unavailable":
        return "The required sensor is not available on this device.";
      case "gps-unavailable":
        return "GPS is not available or disabled on this device.";
      case "nfc-unavailable":
        return "NFC is not available on this device.";
      case "bluetooth-unavailable":
        return "Bluetooth is not supported on this device.";
      case "biometric-unavailable":
        return "Biometric authentication is not available.";
      case "biometric-lockout":
        return "Biometric authentication is temporarily locked. Try again later.";

      // 🔹 File System & Storage
      case "file-not-found":
        return "The requested file was not found on the device.";
      case "file-read-error":
        return "The file could not be read. It may be corrupted.";
      case "file-write-error":
        return "The file could not be written. Please check storage permissions.";
      case "disk-full":
        return "There is not enough storage space on the device.";
      case "invalid-file-type":
        return "The file type is invalid or not supported.";

      // 🔹 Connectivity & Network
      case "network-unavailable":
        return "The device is not connected to the internet.";
      case "network-timeout":
        return "The network request timed out.";
      case "airplane-mode":
        return "Airplane mode is enabled. Please disable it to continue.";
      case "service-unavailable":
        return "The platform service is currently unavailable. Try later.";

      // 🔹 System & Hardware
      case "low-memory":
        return "The device is running low on memory.";
      case "battery-low":
        return "The battery is too low to complete this action.";
      case "unsupported-os-version":
        return "This feature is not supported on your OS version.";
      case "operation-cancelled":
        return "The platform operation was cancelled.";
      case "timeout":
        return "The platform operation timed out. Please retry.";

      // 🔹 Platform-Specific (iOS / Android)
      case "restricted-api":
        return "This feature is restricted by the operating system.";
      case "background-execution-disabled":
        return "Background execution is not allowed for this app.";
      case "intent-not-found":
        return "The requested Android intent could not be resolved.";
      case "activity-not-found":
        return "The requested Android activity was not found.";
      case "ios-method-unavailable":
        return "This method is not available on iOS.";
      case "android-method-unavailable":
        return "This method is not available on Android.";

      // 🔹 Default fallback
      default:
        return "An unexpected platform error occurred. Please try again.";
    }
  }
}
