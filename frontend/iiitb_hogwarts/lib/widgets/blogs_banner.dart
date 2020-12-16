import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/blog.dart';

class BlogsBanner extends StatelessWidget {

  final Blog blog;
  BlogsBanner({@required this.blog});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(
                  'https://miro.medium.com/max/1024/0*1QRN2XZZUOMgz4Aj'
              ),
              fit: BoxFit.fill
          )
      ),
      child: AspectRatio(
        aspectRatio: 16/9,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
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
                'Blockchain Development - Let\'s begin the journey',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Yatharth Arora, 3rd Year',
                overflow: TextOverflow.ellipsis
              )
            ],
          ),
        )
      ),
    );
  }
}
