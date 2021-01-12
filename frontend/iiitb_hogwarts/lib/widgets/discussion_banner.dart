import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/discussion.dart';

class DiscussionBanner extends StatelessWidget {

  final Discussion discussion;

  DiscussionBanner({@required this.discussion});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor.withOpacity(0.30),
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(discussion.bannerUrl),
              fit: BoxFit.fill),
          boxShadow: [BoxShadow(
              color: Color(0x55000000),
              offset: Offset(4,4),
              blurRadius: 4
          )]
      ),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87])),
          alignment: Alignment.bottomLeft,
          child: Text(
            discussion.title,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.5,
          ),
        ),
      ),
    );
  }
}
