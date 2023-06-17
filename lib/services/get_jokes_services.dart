import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview/controllers/jokes_controller.dart';
import 'package:interview/models/get_jokes_model.dart';

import '../handler/http_handler.dart';

class GetAllJokesServices {
  static Future<void> getAllJokesServices({
    required BuildContext context,
    String? query,
  }) async {
    try {
      String path = 'https://api.chucknorris.io/jokes/search?query=social';
      http.Response response = await http.get(
        Uri.parse(path),
      );
      HttpHandler.handleHttpError(
        response: response,
        context: context,
        onSuccess: () async {
          Map<String, dynamic> datas = json.decode(response.body);
          // print(datas);
          print('-------------------------------------------------------');
          List<dynamic> responses = datas['result'];
          // print(responses);
          List<JokesAPI> getAllJokes = [];
          for (var data in responses) {
            getAllJokes.add(JokesAPI.fromMap(data));
          }
          getJoke.getJokes(getAllJokes);
        },
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 2000),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text(
            error.toString(),
            style: TextStyle(backgroundColor: Colors.white),
          ),
        ),
      );
    }
  }
}
