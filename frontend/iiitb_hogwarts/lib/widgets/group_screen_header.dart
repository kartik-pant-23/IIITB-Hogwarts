import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/group.dart';

class GroupScreenHeader extends StatelessWidget {
  final Group group;

  GroupScreenHeader({@required this.group});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: group.groupLogo,
          child: Container(
            width: double.infinity,
            height: 260,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(group.groupLogo), fit: BoxFit.cover),
                boxShadow: [BoxShadow(color: Color(0x55000000), blurRadius: 12)]),
            child: Container(color: Colors.black54),
          ),
        ),
        Container(
          width: double.infinity,
          height: 260,
          margin: const EdgeInsets.all(12),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(group.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 2),
              Text(group.tagline ?? '',
                  textScaleFactor: 1, textAlign: TextAlign.center),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(color: Colors.white),
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('MEMBERS', textScaleFactor: 1),
                          Text('${group.numOfMembers ?? '-'}',
                            textScaleFactor: 2,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )),
                  Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('CURRENT SCORE', textScaleFactor: 1),
                          Text('${group.groupScore ?? '-'}',
                            textScaleFactor: 2,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
