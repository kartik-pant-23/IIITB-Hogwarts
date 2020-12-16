import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';
import 'package:iiitb_hogwarts/widgets/group_badge.dart';

class GroupScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GroupBadge(
            width: 120,
            image: GROUP_LOGOS[3],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(GROUP_NAMES[3], style: TextStyle(fontWeight: FontWeight.bold)),
                Text(GROUP_TAGLINES[3], softWrap: true, textScaleFactor: 1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
