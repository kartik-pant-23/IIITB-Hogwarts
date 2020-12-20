import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/widgets/group_screen_header.dart';

class GroupInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget userTile() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kartik', textScaleFactor: 1.4),
                  Text('Lorem Ipsum Yeah Whatever Lorem Ipsum Yeah Whatever Lorem Ipsum Yeah Whatever',
                      textScaleFactor: 1.2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            SizedBox(width: 12),
            Text('11', textScaleFactor: 1.6),
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
            SliverToBoxAdapter(
              child: GroupScreenHeader(),
            )
          ];
        },
        body: ListView.separated(
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(color: Colors.grey),
              );
            },
            padding: const EdgeInsets.all(8),
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return userTile();
            }));
  }
}
