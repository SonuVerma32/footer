import 'package:http/http.dart' as http;
import 'dart:convert';
String urls = "http://physicspedia.co.in/quiz-app/api/";
String x_api_key = "OjvxjFuxf5xOLip7EWjwxJaTCTioe6sS";

Future<http.Response> loginApi(Map<String, dynamic> jsonBody) async {
  final response = await http.post('$urls' + "user/login",body: jsonBody,
      headers: {'x-api-key': x_api_key});
  return response;
}

Future<http.Response> signUpApi(Map<String, dynamic> jsonBody) async {
  final response = await http.post('$urls' + "user/create",body: jsonBody,
      headers: {'x-api-key': x_api_key});
  return response;
}

Future<http.Response> updateApi(Map<String, dynamic> jsonBody) async {
  final response = await http.post('$urls' + "user/update",body: jsonBody,
      headers: {'x-api-key': x_api_key});
  return response;
}

Future<http.Response> socialloginApi(Map<dynamic, dynamic> jsonBody) async {
  final response = await http.post('$urls' + "user/sociallogin",body: jsonBody,
      headers: {'x-api-key': x_api_key});
  return response;
}

Future<http.Response> getVersionApi() async {
  final response = await http.get('$urls' + "home/version",
      headers: {'x-api-key': x_api_key});
  return response;
}

Future<http.Response> userUpdateApi() async {
  final response = await http.get('$urls' + "user/update",
      headers: {'x-api-key': x_api_key});
  return response;
}

Future<http.Response> mainCategoryApi() async {
  final response = await http.get('$urls' + "category/main",
      headers: {'x-api-key': x_api_key});
  return response;
}

Future<http.Response> subCategoryApi() async {
  final response = await http.get('$urls' + "category/sub_category/1",
      headers: {'x-api-key': x_api_key});
  return response;
}