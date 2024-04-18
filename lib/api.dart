import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kitchenwise/env/env.dart';

Future<String?> fetchImageUrl(String description) async {
  final response = await http.get(
    Uri.parse('https://api.pexels.com/v1/search?query=$description&per_page=1'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: Env.pexelsApiKey,
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    final responseJsonUrl = (jsonDecode(response.body)
        as Map<String, dynamic>)['photos'][0]['src']['original'];
    if (responseJsonUrl == null) {
      return 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Fl%C3%A8che_en_feu_-_Spire_on_Fire.jpeg/1280px-Fl%C3%A8che_en_feu_-_Spire_on_Fire.jpeg';
    }
    return responseJsonUrl;
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load album');
  }
}
