import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/services/api_services.dart';

import 'components/customListTile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Color mainColor = Color(0xffb2d2c1);
  Color mainColor = Color(0xff212529);

  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NewsForAll",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // backgroundColor: Colors.white,
        backgroundColor: mainColor,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: articles.length,
              itemBuilder: (context, index) => customListTile(articles[index] ,context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
