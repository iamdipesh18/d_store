/// A centralized class for validating common form fields like
/// text, email, password, and phone numbers.
///
/// Each method returns a `String?` where:
/// - `null` → means validation passed (no error).
/// - `String` → means validation failed (error message).
///
/// Usage Example:
/// ```dart
/// final error = TValidator.validateEmail(emailController.text);
/// if (error != null) {
///   // show error in UI
/// }
/// ```
class TValidator {
  /// Regex for validating email format
  /// Covers most valid formats including dots, underscores, numbers, and domains.
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Regex for validating strong password
  /// Must contain:
  /// - At least 1 uppercase letter
  /// - At least 1 lowercase letter
  /// - At least 1 digit
  /// - At least 1 special character
  /// - Minimum 8 characters long
  static final RegExp _passwordUppercase = RegExp(r'[A-Z]');
  static final RegExp _passwordLowercase = RegExp(r'[a-z]');
  static final RegExp _passwordDigit = RegExp(r'\d');
  static final RegExp _passwordSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  /// Regex for validating phone numbers
  /// Supports digits only with 10–15 characters (international format).
  /// Example valid: 9812345678, 9779812345678
  static final RegExp _phoneRegex = RegExp(r'^\d{10,15}$');

  // --------------------------------------------------------
  // TEXT VALIDATION
  // --------------------------------------------------------

  /// Validates if the given text is empty.
  /// fieldName is used to display meaningful error messages.
  static String? validateEmptyText(String? fieldName, String? value) {
    final trimmedValue = value?.trim() ?? '';
    if (trimmedValue.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // --------------------------------------------------------
  // EMAIL VALIDATION
  // --------------------------------------------------------

  /// Validates if the provided value is a valid email.
  /// Returns an error message if invalid.
  static String? validateEmail(String? value) {
    final trimmedValue = value?.trim() ?? '';
    if (trimmedValue.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!_emailRegex.hasMatch(trimmedValue)) {
      return 'Invalid email format';
    }
    return null;
  }

  // --------------------------------------------------------
  // PASSWORD VALIDATION
  // --------------------------------------------------------

  /// Validates if the provided value is a strong password.
  ///
  /// Rules:
  /// - At least 8 characters
  /// - Must contain uppercase, lowercase, digit, and special character
  static String? validatePassword(String? value) {
    final trimmedValue = value?.trim() ?? '';
    if (trimmedValue.isEmpty) {
      return 'Password cannot be empty';
    }
    if (trimmedValue.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!_passwordUppercase.hasMatch(trimmedValue)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!_passwordLowercase.hasMatch(trimmedValue)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!_passwordDigit.hasMatch(trimmedValue)) {
      return 'Password must contain at least one digit';
    }
    if (!_passwordSpecialChar.hasMatch(trimmedValue)) {
      return 'Password must contain at least one special character';
    }
    return null; //  Passed all rules
  }

  // --------------------------------------------------------
  // PHONE VALIDATION
  // --------------------------------------------------------

  /// Validates if the provided value is a valid phone number.
  /// Rules:
  /// - Only digits allowed
  /// - Must be between 10–15 digits
  static String? validatePhoneNumber(String? value) {
    final trimmedValue = value?.trim() ?? '';
    if (trimmedValue.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (!_phoneRegex.hasMatch(trimmedValue)) {
      return 'Invalid phone number format';
    }
    return null;
  }
}
