/// Handles invalid data or format issues (e.g. bad JSON, invalid input).
class TFormatException implements Exception {
  /// The associated error message
  final String message;

  // Default Constructor with a generic error message
  const TFormatException([this.message = " An unexpected format error occurred. Please check your input."]);

  // Create a Format Exception from a specific error message
  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  // Get the corresponding error message
  String get formattedMessage => message;

  // Create a format exception from a specific error code
  factory TFormatException.fromCode(String code) {
    switch (code) {
      // 🔹 Email & User Input
      case 'invalid-email-format':
        return const TFormatException(
          'The email address format is invalid. Please enter a valid email.',
        );
      case 'invalid-phone-format':
        return const TFormatException(
          'The phone number format is invalid. Please enter a valid phone number.',
        );
      case 'invalid-username':
        return const TFormatException(
          'Usernames can only contain letters, numbers, and underscores.',
        );
      case 'invalid-password':
        return const TFormatException(
          'The password format is invalid. It must meet the required complexity.',
        );
      case 'invalid-url':
        return const TFormatException(
          'The provided URL is not valid. Please enter a proper URL.',
        );
      case 'invalid-uuid':
        return const TFormatException(
          'The provided ID/UUID is invalid or malformed.',
        );

      // 🔹 JSON / Data Parsing
      case 'invalid-json':
        return const TFormatException(
          'The JSON data is invalid or corrupted.',
        );
      case 'missing-json-key':
        return const TFormatException(
          'The required key is missing in the JSON data.',
        );
      case 'unexpected-json-type':
        return const TFormatException(
          'The JSON value type is not as expected.',
        );
      case 'malformed-response':
        return const TFormatException(
          'The server response was malformed and could not be processed.',
        );

      // 🔹 Numbers & Dates
      case 'invalid-integer':
        return const TFormatException(
          'The provided number is not a valid integer.',
        );
      case 'invalid-double':
        return const TFormatException(
          'The provided number is not a valid decimal/double.',
        );
      case 'invalid-date':
        return const TFormatException(
          'The provided date format is invalid. Please use YYYY-MM-DD.',
        );
      case 'invalid-time':
        return const TFormatException(
          'The provided time format is invalid. Please use HH:MM.',
        );
      case 'invalid-datetime':
        return const TFormatException(
          'The provided datetime format is invalid.',
        );

      // 🔹 Files & Encoding
      case 'invalid-file-format':
        return const TFormatException(
          'The file format is invalid or not supported.',
        );
      case 'invalid-image-format':
        return const TFormatException(
          'The image format is invalid or corrupted.',
        );
      case 'invalid-audio-format':
        return const TFormatException(
          'The audio format is invalid or not supported.',
        );
      case 'invalid-video-format':
        return const TFormatException(
          'The video format is invalid or corrupted.',
        );
      case 'invalid-encoding':
        return const TFormatException(
          'The text encoding is invalid or not supported.',
        );
      case 'base64-decode-failed':
        return const TFormatException(
          'The Base64 string could not be decoded. It may be corrupted.',
        );

      // 🔹 Network / API Data
      case 'invalid-query-parameter':
        return const TFormatException(
          'The query parameter provided is invalid.',
        );
      case 'invalid-request-payload':
        return const TFormatException(
          'The request payload format is invalid.',
        );
      case 'invalid-response-format':
        return const TFormatException(
          'The server response format is not valid or cannot be parsed.',
        );

      // 🔹 Default fallback
      default:
        return const TFormatException();
    }
  }
}
