/// Handles general Firebase (non-Auth) exceptions in a human-readable way.
class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      // 🔹 Common Firestore Errors
      case "cancelled":
        return "The operation was cancelled. Please try again.";
      case "unknown":
        return "An unknown error occurred. Please try again later.";
      case "invalid-argument":
        return "An invalid argument was provided. Please check your input.";
      case "deadline-exceeded":
        return "The request took too long to complete. Try again later.";
      case "not-found":
        return "The requested resource was not found.";
      case "already-exists":
        return "The resource already exists.";
      case "permission-denied":
        return "You do not have permission to perform this action.";
      case "resource-exhausted":
        return "Resource quota exceeded or rate limit reached. Please wait and try again.";
      case "failed-precondition":
        return "The operation was rejected due to failed preconditions.";
      case "aborted":
        return "The operation was aborted. Please retry.";
      case "out-of-range":
        return "The operation was attempted past the valid range.";
      case "unimplemented":
        return "This operation is not implemented or not supported.";
      case "internal":
        return "An internal error occurred. Please try again later.";
      case "unavailable":
        return "The service is currently unavailable. Please try again later.";
      case "data-loss":
        return "Data loss occurred. Please contact support.";
      case "unauthenticated":
        return "You need to be authenticated to perform this action.";

      // 🔹 Firestore-Specific
      case "invalid-collection-id":
        return "The collection ID provided is invalid.";
      case "transaction-failed":
        return "The Firestore transaction failed. Please try again.";
      case "snapshot-inconsistent":
        return "The Firestore snapshot is inconsistent. Please retry.";
      case "invalid-field-path":
        return "The provided Firestore field path is invalid.";
      case "invalid-document-reference":
        return "The provided document reference is invalid.";

      // 🔹 Firebase Storage Errors
      case "object-not-found":
        return "The requested file does not exist in storage.";
      case "bucket-not-found":
        return "The specified storage bucket was not found.";
      case "project-not-found":
        return "The Firebase project was not found.";
      case "quota-exceeded":
        return "Storage quota has been exceeded. Please delete unused files.";
      case "unauthorized":
        return "You are not authorized to access this resource.";
      case "unauthenticated-storage":
        return "You must be signed in to access Firebase Storage.";
      case "invalid-checksum":
        return "The uploaded file checksum does not match. Please retry.";
      case "canceled":
        return "The storage operation was canceled.";

      // 🔹 Realtime Database Errors
      case "write-canceled":
        return "The database write was canceled.";
      case "invalid-token":
        return "Invalid authentication token for the database.";
      case "expired-token":
        return "Your database session has expired. Please log in again.";
      case "max-retries":
        return "The database request failed after maximum retries.";
      case "overridden-by-set":
        return "The database update was overridden by a set() call.";
      case "network-error":
        return "A network error occurred while accessing the database.";

      // 🔹 Firebase Functions Errors
      case "functions/invalid-argument":
        return "Invalid argument provided to the function.";
      case "functions/deadline-exceeded":
        return "The cloud function took too long to respond.";
      case "functions/not-found":
        return "The requested function was not found.";
      case "functions/permission-denied":
        return "You don't have permission to call this function.";
      case "functions/resource-exhausted":
        return "Function quota exceeded. Please try again later.";
      case "functions/internal":
        return "An internal error occurred while executing the function.";
      case "functions/unavailable":
        return "The function service is unavailable right now.";
      case "functions/unauthenticated":
        return "You must be signed in to call this function.";

      // 🔹 Default
      default:
        return "An unexpected Firebase error occurred. Please try again.";
    }
  }
}
