import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submisi_1/model/article_model.dart';
import 'package:submisi_1/screen/ArticleDetailPage.dart';

class BookmarkPage extends StatefulWidget {
  final Article article;

  BookmarkPage({required this.article});

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}


class _BookmarkPageState extends State<BookmarkPage> {
  late List<Article> bookmarks;

  @override
  void initState() {
    super.initState();
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> bookmarkJsonList = prefs.getStringList('bookmarks') ?? [];
    bookmarks = bookmarkJsonList.map((json) => Article.fromJson(jsonDecode(json))).toList();
  }

  Future<void> saveBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> bookmarkJsonList = bookmarks.map((article) => jsonEncode(article.toString())).toList();
    prefs.setStringList('bookmarks', bookmarkJsonList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: ListView.builder(
        itemCount: bookmarks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(bookmarks[index].title),
            subtitle: Text(bookmarks[index].description.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailPage(article: bookmarks[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}