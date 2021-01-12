import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/models/home_page_data.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/screens/fragments/about_the_app.dart';
import 'package:iiitb_hogwarts/screens/fragments/about_the_makers.dart';
import 'package:iiitb_hogwarts/screens/fragments/chat_room.dart';
import 'package:iiitb_hogwarts/screens/fragments/dashboard.dart';
import 'package:iiitb_hogwarts/screens/fragments/feedback.dart';
import 'package:iiitb_hogwarts/screens/fragments/get_featured.dart';
import 'package:iiitb_hogwarts/screens/fragments/group.dart';
import 'package:iiitb_hogwarts/screens/fragments/profile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List fragments = [
    Dashboard(),
    ChatRoom(),
    GroupInfo(),
    Profile(),
    GetFeatured(),
    FeedbackScreen(),
    AboutTheMakers(),
    AboutTheApp()
  ];

  final List<String> fragmentTitles = [
    'Dashboard',
    'Chat Room',
    'Group Info',
    'Profile',
    'Get Featured',
    'Send Feedback',
    'About The Makers',
    'About IIITB Hogwarts'
  ];

  final List<IconData> fragmentIcons = [
    Icons.assignment,
    Icons.send_rounded,
    Icons.group_rounded,
    Icons.person,
    Icons.star,
    Icons.feedback,
    Icons.alternate_email_rounded,
  ];

  final Color primary = Color(0xFF480945),
      accent = Color(0xFFDF267C);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedFragment = 0;
  StreamController tabController;
  Stream tabs;

  HomePageData data = HomePageData();

  @override
  void initState() {
    tabController = StreamController();
    tabs = tabController.stream.asBroadcastStream();
    tabController.add(0);
    super.initState();
  }

  @override
  void dispose() {
    tabController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget drawerTile({@required int index}) {
      return StreamBuilder(
        stream: tabs,
        initialData: selectedFragment,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              selectedFragment = index;
              tabController.add(selectedFragment);
              Navigator.of(context).pop();
            },
            child: ListTile(
                selected: index == selectedFragment,
                tileColor: primary,
                selectedTileColor: accent,
                title: Text(
                  fragmentTitles[index],
                  style: TextStyle(color: Colors.white),
                ),
                leading: (index == 7)
                    ? Image.asset('images/ic_foreground.png', height: 24, width: 24)
                    : Icon(fragmentIcons[index], color: Colors.white)
            ),
          );
        }
      );
    }

    Widget drawer() {
      return Drawer(
        child: SafeArea(
          child: Container(
            color: Color(0xFF480945),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/ic_foreground.png',
                              width: 32, height: 32),
                          SizedBox(width: 12),
                          Text(
                            'IIITB Hogwarts',
                            textScaleFactor: 1.8,
                          )
                        ],
                      ),
                    ),
                    Divider(
                        color: Theme
                            .of(context)
                            .accentColor
                            .withOpacity(0.5)),
                    SizedBox(height: 6),
                    Text(
                      'NAVIGATE TO',
                      textScaleFactor: 1.2,
                    ),
                    drawerTile(index: 0),
                    drawerTile(index: 1),
                    drawerTile(index: 2),
                    drawerTile(index: 3),
                    SizedBox(height: 12),
                    Text(
                      'MORE OPTIONS',
                      textScaleFactor: 1.2,
                    ),
                    drawerTile(index: 4),
                    drawerTile(index: 5),
                    SizedBox(height: 12),
                    Text(
                      'KNOW MORE',
                      textScaleFactor: 1.2,
                    ),
                    drawerTile(index: 6),
                    drawerTile(index: 7),
                    SizedBox(height: 12),
                    Text(
                      'SETTINGS',
                      textScaleFactor: 1.2,
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: ListTile(
                        tileColor: primary,
                        title: Text(
                          'Sign Out',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading:
                        Icon(Icons.logout, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    Future<bool> onBackPressed() async {
      if (selectedFragment != 0) {
        selectedFragment = 0;
        tabController.add(selectedFragment);
        return false;
      }
      return showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                backgroundColor: Color(0xFF480945),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 24),
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/ic_foreground.png',
                        width: 32, height: 32),
                    SizedBox(width: 12),
                    Text(
                      'IIITB Hogwarts',
                      textScaleFactor: 1.4,
                    )
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(color: Theme
                        .of(context)
                        .accentColor
                        .withOpacity(0.5)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Is that it.. You want to exit the app?'),
                    ),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text('NO')
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('YES')
                  ),
                ],
              ));
    }

    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            elevation: 4,
            backgroundColor: Color(0xFF480945),
            title: Text(fragmentTitles[selectedFragment]),
            centerTitle: true,
            leading: IconButton(
              icon: Image.asset(
                'images/ic_drawer.png', height: 24, width: 24,),
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
          ),
          drawer: drawer(),
          body: FutureBuilder(
              future: data.init(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Scaffold(
                      body: Center(child: CircularProgressIndicator()));
                else if (snapshot.hasData && snapshot.data) {
                  return StreamBuilder(
                    stream: tabs,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return fragments[0];
                      return fragments[snapshot.data];
                    },
                  );
                }
                return Center(child: Text(snapshot.error.toString(), textAlign: TextAlign.center));
              }
          )
      ),
    );
  }
}