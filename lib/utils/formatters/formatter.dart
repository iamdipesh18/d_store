import 'package:intl/intl.dart';

class TFormatter {
  /// Formats a date to a readable string.
  static String formatDate(DateTime date) {
    // Example format: '2023-10-01 – 14:30'
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  /// Formats a number to a currency string.
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  /// Formats a percentage value.
  static String formatPercentage(double value) {
    return NumberFormat.percentPattern().format(value);
  }

  /// Formats a phone number.
  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit phone number for simplicity
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    } else {
      return phoneNumber; // Return as is if it doesn't match expected formats
    }
  }

  // International formatting for numbers
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    String digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 7) return phoneNumber; // too short to format

    // Assume country code is first 2–4 digits depending on length
    String countryCode = '';
    String localNumber = '';

    if (digitsOnly.startsWith('977') && digitsOnly.length >= 12) {
      // Example for Nepal
      countryCode = '977';
      localNumber = digitsOnly.substring(3);
    } else if (digitsOnly.startsWith('1') && digitsOnly.length >= 11) {
      // Example for US
      countryCode = '1';
      localNumber = digitsOnly.substring(1);
    } else {
      // Fallback: first 2-3 digits as country code
      countryCode = digitsOnly.substring(0, 2);
      localNumber = digitsOnly.substring(2);
    }

    return '+$countryCode $localNumber';
  }
}
