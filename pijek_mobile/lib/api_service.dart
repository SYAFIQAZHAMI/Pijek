import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService extends GetxService {
  static const String baseUrl = "http://127.0.0.1:8000/api";
  
  // Header standar untuk efisiensi
  Map<String, String> _getHeaders(String? token) {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // Method GET yang dipadu dengan caching lokal (Optimal)
  Future<dynamic> get(String endpoint, {bool useCache = false}) async {
    final prefs = await SharedPreferences.getInstance();
    
    if (useCache) {
      final cachedData = prefs.getString(endpoint);
      if (cachedData != null) return jsonDecode(cachedData);
    }

    try {
      final response = await http.get(Uri.parse("$baseUrl/$endpoint"), headers: _getHeaders(null));
      if (response.statusCode == 200) {
        if (useCache) prefs.setString(endpoint, response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("Network Error: $e");
    }
    return null;
  }
}
