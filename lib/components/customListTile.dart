
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  Color mainColor = Color(0xff212529);
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => ArticlePage(article: article,),),);


    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(color: Colors.white70, blurRadius: 3.0),
        ],
      ),
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
          SizedBox(height: 8.0,),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              article.source.name, style: TextStyle(color: Colors.red),),
          ),
          SizedBox(height: 8.0,),
          Text(article.title,
            style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold, fontSize: 16.0),)
        ],
      ),
    ),
  );
}
