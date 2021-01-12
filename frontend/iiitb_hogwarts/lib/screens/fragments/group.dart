import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/group.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/services/load_data.dart';
import 'package:iiitb_hogwarts/widgets/group_screen_header.dart';

class GroupInfo extends StatefulWidget {
  final Group group;

  GroupInfo({this.group});

  @override
  _GroupInfoState createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget userTile({User user}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name ?? '-', textScaleFactor: 1.4),
                  Visibility(
                    visible: user.about.isNotEmpty,
                    child: Text(user.about ?? '-',
                        textScaleFactor: 1.2, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12),
            Text('${user.score ?? '0'}', textScaleFactor: 1.6),
            SizedBox(width: 12),
            Icon(Icons.chevron_right, color: Colors.white)
          ],
        ),
      );
    }

    return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(child: GroupScreenHeader(group: widget.group))
          ];
        },
        body: FutureBuilder(
            future: DataLoader().getUsersList(widget.group),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else if (snapshot.hasData) {
                return ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(color: Colors.grey),
                      );
                    },
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return userTile(user: snapshot.data[index]);
                    });
              }
              return Center(child: Text(snapshot.error.toString()));
            }));
  }
}
