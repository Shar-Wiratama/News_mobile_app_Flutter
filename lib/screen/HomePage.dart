import 'package:flutter/material.dart';
import 'package:submisi_1/model/article_model.dart';
import 'package:submisi_1/screen/BookmarkPage.dart';
import 'package:submisi_1/services/service_api.dart';
import 'package:submisi_1/widget/customListTile.dart';

class HomePage extends StatelessWidget {
  HomePage();

  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Portal Berita",
            style: TextStyle(
              color: Colors.white,
            )
          ),
           backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              // // Article article = articles[index];
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => BookmarkPage(article: null),
              //   ),
              // );
            },
          ),
        ],
      ),
       body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.requireData;

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
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