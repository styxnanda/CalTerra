import "package:calterra/viewModel/emission_data.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';
import "dart:convert";

class ApiService{
  final String baseURL = "https://calterra-api.vercel.app";

  Future<http.Response> getData(String endpoint) async {
    final url = Uri.parse('$baseURL/$endpoint');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? cookie = preferences.getString('cookie');

    var headers = <String, String>{};
    if(cookie != null){
      headers['Cookie'] = cookie;
    }
    return await http.get(url, headers: headers);
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

    debugPrint('POST $url\nHeaders: $headers\nBody: $body');
    return await http.post(url, headers: headers, body: body);
  }

  Future<EmissionData> fetchEmissionData() async {
    final response = await getData('user/change');
    if(response.statusCode == 200){
      return EmissionData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch emission data with error code: ${response.statusCode}');
    }
  }
}
