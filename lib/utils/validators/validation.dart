class TValidator{
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Regular expression for validating email format
    // This regex checks for a basic email format: local-part@domain
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    // Check if the value matches the email regex
    // If it doesn't match, return an error message
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }
  
  // Method to validate password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // Check if the password is at least 6 characters long
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    // Check for Uppercase Letters
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    // Check for Lowercase Letters
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    // Check for Digits
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    // Check for Special Characters
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null; // If all checks pass, return null indicating no error
  }

  // Method to validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    // Regular expression for validating phone number format
    // This regex checks for a basic phone number format: digits only, 10-15 digits long
    final phoneRegex = RegExp(r'^\d{10,15}$');

    // Check if the value matches the phone regex
    // If it doesn't match, return an error message
    if (!phoneRegex.hasMatch(value)) {
      return 'Invalid phone number format';
    }
    return null;
  }
  
}