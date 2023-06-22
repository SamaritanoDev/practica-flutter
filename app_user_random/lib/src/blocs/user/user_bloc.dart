import 'dart:convert';

import 'package:app_user_random/src/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserBloc {
  final user = ValueNotifier<User?>(null);

  Future<void> fetchUser() async {
    try {
      final response = await http.get(Uri.parse("https://randomuser.me/api/?gender=female"));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final results = jsonData['results'];

        if (results != null && results.isNotEmpty) {
          final userObject = User.fromJson(results[0]);
          user.value = userObject;
        }
      } else {
        throw Exception('Failed to fetch user');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void dispose() {
    user.dispose();
  }
}
