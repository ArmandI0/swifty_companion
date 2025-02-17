import 'dart:convert';
import 'Requests.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>?> SearchOnApi42(nickname) async {
  final tokenManage = TokenManager();
  String? token = await tokenManage.getToken();
  print(nickname);
  final url = "https://api.intra.42.fr/v2/users?filter[login]=$nickname";

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    print("ERROR: ${response.statusCode}");
    return null;
  }
}
