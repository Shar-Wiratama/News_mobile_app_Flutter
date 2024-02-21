import 'package:flutter/material.dart';
import 'package:submisi_1/model/article_model.dart';
import 'package:submisi_1/screen/ArticleDetailPage.dart';

Widget customListTile(Article article, BuildContext context){

  return InkWell(
        onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleDetailPage(
                    article: article,
                  )
                )
              );
    },
     child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
     child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage.toString()), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
           SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
            ),
          child: Text(
              article.author.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
           SizedBox(
              height: 8.0,
            ),
            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(
            //       icon: Icon(
            //         bookmarks.contains(article) ? Icons.bookmark : Icons.bookmark_border,
            //         color: Colors.blue,
            //       ),
            //       onPressed: onTap,
            //     ),
            //     IconButton(
            //       icon: Icon(
            //         Icons.share,
            //         color: Colors.blue,
            //       ),
            //       onPressed: () {
            //         // Implement share functionality
            //       },
            //     ),
            //   ],
            // ),

        ],
      ),
    ),
  );
}