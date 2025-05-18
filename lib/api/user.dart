import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_chatting_app/modal/user.dart';

class UserApi {
  static Future<List<UserModal>> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode != 200) {
        throw Exception('Failed to load users');
      }
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((json) => UserModal(
                id: json['id'],
                name: json['name'],
                email: json['email'],
              ))
          .toList();
    } catch (e) {
      // Handle or log error as needed
      print('Error fetching users: $e');
      return [];
    }
  }
}
