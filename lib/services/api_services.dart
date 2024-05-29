import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_app/models/user_model.dart';

Future<RandomUser> fetchData() async {
  const url = 'https://randomuser.me/api/?inc=gender,name,nat,email,picture';

  final response = await http.get(Uri.parse(url));

  try {
    return RandomUser.fromJson(jsonDecode(response.body));
  } catch (e) {
    throw Exception('Erro ao obter o usuário');
  }
}
