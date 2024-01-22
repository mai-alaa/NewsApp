import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_get/controller/news_controller.dart';
import 'package:news_app_get/model/news_model.dart';

class Health extends GetWidget<NewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health"),
      ),
      body: FutureBuilder<Articles?>(
        future: controller.getData("health"),
        builder: (context, AsyncSnapshot<Articles?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            Articles data = snapshot.data!; // Use the null assertion operator
            return ListView.builder(
              itemCount: data.articles.length,
              itemBuilder: (context, int index) {
                return Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: Image.network(
                          data.articles[index].urlToImage.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        data.articles[index].title.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        data.articles[index].description.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
