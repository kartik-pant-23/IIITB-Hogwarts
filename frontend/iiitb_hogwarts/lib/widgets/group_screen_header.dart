import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/utils/important_strings.dart';
import 'package:iiitb_hogwarts/widgets/group_badge.dart';

class GroupScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(GROUP_LOGOS[2]),
            fit: BoxFit.cover
        ),
        boxShadow: [BoxShadow(
          color: Color(0x55000000),
          blurRadius: 12
        )]
      ),
      child: Container(
        color: Colors.black54,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(GROUP_NAMES[2], style: TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 2),
            Text(GROUP_TAGLINES[2], textScaleFactor: 1, textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(color: Colors.white),
            ),
            Row(
              children: [
                Expanded(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('MEMBERS', textScaleFactor: 1),
                    Text('74', textScaleFactor: 2, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )),
                Expanded(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('CURRENT SCORE', textScaleFactor: 1),
                    Text('1034', textScaleFactor: 2, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
