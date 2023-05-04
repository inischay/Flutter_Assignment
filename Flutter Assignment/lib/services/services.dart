import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchGenres() async {
  print("Hii this an api");
  final response = await http
      .get(Uri.parse('https://apimocha.com/flutterassignment/getGenres'));
  if (response.statusCode == 200) {
    final Map<String, dynamic>? responseData = jsonDecode(response.body);
    final List<dynamic>? genres = responseData?['genres'];
    return genres ?? []; // return empty list if genres is null
  } else {
    throw Exception('Failed to load news');
  }
}
