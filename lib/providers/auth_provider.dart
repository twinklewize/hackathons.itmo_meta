import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'user_provider.dart';

class AuthProvider with ChangeNotifier {
  // возвращает статус код
  Future<int> login(int isu, String password, BuildContext context) async {
    final url = Uri.parse('http://172.28.96.206:2021/ItmoMeta/api/auth/login');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(
        {
          'isu': isu,
          'password': password,
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      return response.statusCode;
    }
    if (response.statusCode == 200) {
      Provider.of<UserProvider>(context, listen: false).userEntity.id = isu;
    }
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }

  // возвращает статус код
  Future<int> register(int isu, String password, BuildContext context) async {
    final url =
        Uri.parse('http://172.28.96.206:2021/ItmoMeta/api/auth/register');
    final response = await http.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: json.encode(
        {
          'isu': isu,
          'password': password,
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      return response.statusCode;
    }
    if (response.statusCode == 200) {
      Provider.of<UserProvider>(context, listen: false).userEntity.id = isu;
    }
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }
}
