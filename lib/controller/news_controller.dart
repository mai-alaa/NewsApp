import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_get/model/news_model.dart';

class NewsController extends GetxController {
  RxInt currentIndex = 0.obs;

  Future<Articles?> getData(String cat) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=${cat}&apiKey=347803307eab4401aa28c4c79c928c6b');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return Articles.fromJson(jsonDecode(response.body));
      } else {
        // If the response status code is not 200, throw an exception or return null.
        // You can choose how to handle this error case.
        throw Exception(
            'Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request.
      Get.snackbar("Error", e.toString());
      return null;
    }
  }
}
