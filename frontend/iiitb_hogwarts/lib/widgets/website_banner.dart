import 'package:flutter/material.dart';

class WebsiteBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          )
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
                style: TextStyle(fontSize: 20),
              ),
              Text(
                  'Visit the official website'
              )
            ],
          ),
        ),
      ),
    );
  }
}
