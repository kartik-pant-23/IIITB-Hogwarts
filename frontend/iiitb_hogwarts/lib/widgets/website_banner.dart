import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        const url = 'https://iiitbhopal.ac.in/';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(
                    'https://iiitbhopal.ac.in/Design/Banner/Slide1.jpg'
                ),
                fit: BoxFit.fill
            ),
            boxShadow: [BoxShadow(
                color: Color(0x55000000),
                offset: Offset(4,4),
                blurRadius: 4
            )]
        ),
        child: AspectRatio(
          aspectRatio: 4/3,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87]
                )
            ),
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'IIIT Bhopal',
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1.5,
                ),
                Text(
                  'Visit the official website',
                  textScaleFactor: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
