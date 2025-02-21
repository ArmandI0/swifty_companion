import 'dart:convert';
import 'TokenManager.dart';
import 'package:http/http.dart' as http;


Map<String, dynamic> _buildUserMap(Map<String, dynamic> data) {
  List<Map<String, dynamic>>? skills;
  if (data['active?'] == true && data['cursus_users'] != null) {
    var cursus42 = (data['cursus_users'] as List).firstWhere(
      (cursus) => cursus['cursus']['id'] == 21,
      orElse: () => null,
    );
    
    if (cursus42 != null && cursus42['skills'] != null) {
      skills = (cursus42['skills'] as List).map((skill) => {
        'id': skill['id'] ?? 0,
        'name': skill['name'] ?? '',
        'level': skill['level'] ?? 0.0,
      }).toList().cast<Map<String, dynamic>>();
    }
  }

  return {
    'id': data['id'] ?? 0,
    'email': data['email'] ?? '',
    'login': data['login'] ?? '',
    'wallet': data['wallet'] ?? 0,
    'correction_point': data['correction_point'] ?? 0,
    'phone': data['phone'] ?? 'No phone',
    'image': data['image'] != null
      ? {
          'link': data['image']['link'] ?? '',
          'medium': data['image']['versions']['medium'] ?? '',
        }
      : null,
    'skills': skills,
    'is_active': data['active?'] ?? false,
  };
}

Future<Map<String, dynamic>?> SearchOnApi42(String nickname) async {
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
    try {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return _buildUserMap(data);
    } catch (e) {
      print("Error decoding user data: $e");
      return null;
    }
  } else {
    print("ERROR: ${response.statusCode}");
    return null;
  }
}
