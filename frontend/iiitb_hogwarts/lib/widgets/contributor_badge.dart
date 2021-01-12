import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContributorBadge extends StatelessWidget {
  final String userName;

  ContributorBadge({@required this.userName});

  Future<dynamic> loadData() async {
    try {
      var res = await http.get('https://api.github.com/users/$userName');
      if (res.statusCode != 200) {
        print(res.body);
        return null;
      }
      return jsonDecode(res.body);
    } catch (error) {
      print(error);
      return null;
    }
  }

  Widget shimmerCard() {
    return Shimmer.fromColors(
      baseColor: Color(0xFFDF267C).withOpacity(0.50),
      highlightColor: Color(0xFFDF267C).withOpacity(0.10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.grey[500],
          ),
          SizedBox(width: 8),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 20,
                width: 200,
                color: Colors.grey[400],
              ),
              SizedBox(height: 8),
              Container(
                height: 20,
                width: 100,
                margin: EdgeInsets.only(right: 12),
                color: Colors.grey[400],
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget userCard({photo, name, uName, bio, company, twitter, blog}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          radius: 36,
          backgroundImage: NetworkImage(photo),
        ),
        SizedBox(width: 8),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
              Text(uName, textScaleFactor: 2),
              (name == null || name == "")
                  ? Container()
                  : Text('($name)',
                      style: TextStyle(color: Colors.white54),
                      textScaleFactor: 1.5),
            ]))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        decoration: BoxDecoration(
          color: Color(0xFFDF267C).withOpacity(0.30),
          borderRadius: BorderRadius.circular(8),
        ),
        child: FutureBuilder(
            future: loadData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return shimmerCard();
              else if (snapshot.hasError || snapshot.data == null)
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_rounded, color: Color(0xFFDF267C)),
                    SizedBox(width: 12),
                    Text('Failed to load data!',
                        style: TextStyle(color: Color(0xFFDF267C)))
                  ],
                );
              var details = snapshot.data;
              return userCard(
                  name: details['name'],
                  uName: details['login'],
                  photo: details['avatar_url']);
            }));
  }
}
