import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';
import "dart:convert";

class ApiService{
  final String baseURL = "https://calterra-api.vercel.app";

  Future<http.Response> getData(String endpoint) async {
    final url = Uri.parse('$baseURL/$endpoint');
    return await http.get(url);
  }

  Future<http.Response> postRequest(String endpoint, Map<String, dynamic> data, {bool urlEncoded = false}) async {
    final url = Uri.parse('$baseURL/$endpoint');    
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? cookie = preferences.getString('cookie');
    var headers = <String, String>{
      'Content-Type': urlEncoded ? 'application/x-www-form-urlencoded' : 'application/json; charset=UTF-8',
      if (cookie != null) 'Cookie': cookie,       
    };
    var body = urlEncoded 
        ? data.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}').join('&') 
        : jsonEncode(data);

    // Print the request URL, headers, and body for debugging
    // debugPrint('Request URL: $url');
    // debugPrint('Request Headers: $headers');
    // debugPrint('Request Body: $body');

    return await http.post(url, headers: headers, body: body);
  }
}
