import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  const ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xff212529);
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (article.urlToImage == null)
                      ? NetworkImage(
                          "https://images.unsplash.com/photo-1620321271188-3f1043222e80?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMzV8fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60")
                      : NetworkImage(article.urlToImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.source.name,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              article.description,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Text( article.content == null ? '' : article.content, maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),),
            ),

          ],
        ),
      ),
    );
  }
}
