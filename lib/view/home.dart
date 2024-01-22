import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app_get/controller/news_controller.dart';
import 'package:news_app_get/view/bottomNavBar/health.dart';
import 'package:news_app_get/view/bottomNavBar/science.dart';
import 'package:news_app_get/view/bottomNavBar/sports.dart';

class HomePage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Sports(),
      Science(),
      Health(),
    ];
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          currentIndex: controller.currentIndex.value,
          onTap: (val) {
            controller.currentIndex.value = val;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
            BottomNavigationBarItem(
                icon: Icon(Icons.science), label: 'Science'),
            BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety), label: 'Health'),
          ]),
      body: GetX<NewsController>(
        builder: (controller) => screens[controller.currentIndex.value],
      ),
    );
  }
}
