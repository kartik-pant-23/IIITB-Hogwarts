import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iiitb_hogwarts/models/group.dart';
import 'package:iiitb_hogwarts/screens/fragments/landing_page.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';

class LeaderBoardBadge extends StatelessWidget {

  final Group group;
  LeaderBoardBadge({@required this.group});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return LandingPage(type: 'group', model: group);
        }));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(group.groupLogo),
            fit: BoxFit.cover
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  begin: Alignment.centerRight, end: Alignment.centerLeft,
                  colors: [Colors.transparent, Colors.black54]
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                group.name,
                style: TextStyle(fontSize: 20),
              ),
              Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
