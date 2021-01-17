import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/group.dart';
import 'package:iiitb_hogwarts/screens/fragments/landing_page.dart';
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
  Widget build(BuildContext context) {

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
                      return ListTile(
                        onTap: () {
                          snapshot.data[index].group = widget.group;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return LandingPage(type: 'user_profile', model: snapshot.data[index]);
                          }));
                        },
                        title: Text(snapshot.data[index].name),
                        subtitle: Visibility(
                          visible: snapshot.data[index].about.isNotEmpty,
                          child: Text(snapshot.data[index].about ?? '-',
                              textScaleFactor: 1.2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFDF267C),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${snapshot.data[index].score}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        trailing:
                            Icon(Icons.chevron_right, color: Colors.white),
                      );
                    });
              }
              return Center(child: Text(snapshot.error.toString()));
            }));
  }
}
