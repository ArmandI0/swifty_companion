import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
export 'TokenManager.dart';

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();

  factory TokenManager() {
    return _instance;
  }

  TokenManager._internal();

  static String tokenUrl = "https://api.intra.42.fr/oauth/token";
  String? uid = dotenv.env['UID'];
  String? secret = dotenv.env['SECRET'];
  String? _token;

  Future<String?> getToken() async {
    if (_token != null)
      return _token;
    else {
      try {
        _token = await getAccessToken();
        return _token;
      } catch (e) {
        print(e);
        return null;
      }
    }
  }

  Future<String?> getAccessToken() async {
    final response = await http.post(
      Uri.parse(tokenUrl),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "grant_type": "client_credentials",
        "client_id": uid,
        "client_secret": secret,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      print("Erreur lors de la récupération du token: ${response.statusCode}");
      return null;
    }
  }
}
