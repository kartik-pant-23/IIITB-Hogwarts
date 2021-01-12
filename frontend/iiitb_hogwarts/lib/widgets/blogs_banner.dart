import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/blog.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogsBanner extends StatelessWidget {

  final Blog blog;
  BlogsBanner({@required this.blog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        String url = blog.blogUrl;
        if (await canLaunch(url)) {
        await launch(url);
        } else {
        throw 'Could not launch $url';
        }
      },
      child: Container(
        margin: EdgeInsets.all(8),
        height: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withOpacity(0.30),
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
                image: NetworkImage(blog.bannerUrl),
                fit: BoxFit.fill,
            ),
          boxShadow: [BoxShadow(
            color: Color(0x55000000),
            offset: Offset(4,4),
            blurRadius: 4
          )]
        ),
        child: AspectRatio(
          aspectRatio: 16/9,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black87]
              )
            ),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.blogTitle,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1.5,
                ),
                Text(
                  '${blog.authorName} | ${blog.authorYear}',
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1,
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
