import 'dart:convert';

import 'package:http/http.dart' as http;

class THttpHelper{
  static const String _baseUrl = 'https://api.example.com';

  // Helper Method to make a GET request
  static Future<Map<String, dynamic>?> getRequest(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      return null; // Not found
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Helper Method to make a POST request
  static Future<Map<String, dynamic>?> postRequest(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }

  // Helper Method to make a PUT request
  static Future<Map<String, dynamic>?> putRequest(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update data');
    }
  }

  // Helper Method to make a DELETE request
  static Future<void> deleteRequest(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete data');
    }
  }

  // Helper Method to handle errors
  static void handleError(http.Response response) {
    if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception('Client error: ${response.statusCode}');
    } else if (response.statusCode >= 500) {
      throw Exception('Server error: ${response.statusCode}');
    }
  }

  // Helper Method to parse JSON response
  static Map<String, dynamic> parseJson(String responseBody) {
    try {
      return json.decode(responseBody);
    } catch (e) {
      throw Exception('Failed to parse JSON: $e');
    }
  }
  // Helper Method to check if response is successful
  static bool isResponseSuccessful(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }
  
}