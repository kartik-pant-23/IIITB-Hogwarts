import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';

class LeaderBoardBadge extends StatelessWidget {

  final int groupCode;
  LeaderBoardBadge({@required this.groupCode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(GROUP_LOGOS[groupCode]),
            fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                GROUP_NAMES[groupCode],
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
