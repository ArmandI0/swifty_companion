import 'dart:convert';
import 'Requests.dart';
import 'package:http/http.dart' as http;
import '../Models/User.dart';

Future<User?> SearchOnApi42(String nickname) async {
  final tokenManage = TokenManager();
  String? token = await tokenManage.getToken();
  final url = "https://api.intra.42.fr/v2/users/$nickname";

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    try {
      return User.fromJson(data);
    } catch (e) {
      print("Error decoding user data: $e");
      return null;
    }
  } else {
    print("ERROR: ${response.statusCode}");
    return null;
  }
}
