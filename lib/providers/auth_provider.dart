import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  // возвращает статус код
  Future<int> login(int isu, String password) async {
    final url = Uri.parse('http://192.168.50.158:2021/api/auth/login');

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

    // TODO добавить какое-то действие
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }

  // возвращает статус код
  Future<int> register(int isu, String password) async {
    final url = Uri.parse('http://192.168.50.158:2021/api/auth/register');

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
    print(response.body);
    notifyListeners();
    return response.statusCode;
  }
}
