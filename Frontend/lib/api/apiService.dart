import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "dart:convert";

class ApiService{
  final String baseURL = "https://calterra-1tp1ufb6j-satya-ananda-sulistios-projects.vercel.app";

  Future<http.Response> getData(String endpoint) async {
    final url = Uri.parse('$baseURL/$endpoint');
    return await http.get(url);
  }

  Future<http.Response> postRequest(String endpoint, Map<String, dynamic> data, {bool urlEncoded = false}) async {
    final url = Uri.parse('$baseURL/$endpoint');
    var headers = <String, String>{
      'Content-Type': urlEncoded ? 'application/x-www-form-urlencoded' : 'application/json; charset=UTF-8',
    };
    var body = urlEncoded 
        ? data.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}').join('&') 
        : jsonEncode(data);

    // Print the request URL, headers, and body for debugging
    print('Request URL: $url');
    print('Request Headers: $headers');
    print('Request Body: $body');

    return await http.post(url, headers: headers, body: body);
  }
}
