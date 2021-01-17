import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/screens/home_page.dart';
import 'package:iiitb_hogwarts/widgets/background_image.dart';
import 'package:iiitb_hogwarts/widgets/transition.dart';

class ShowGroup extends StatefulWidget {
  @override
  _ShowGroupState createState() => _ShowGroupState();
}

class _ShowGroupState extends State<ShowGroup> with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this, duration: Duration(milliseconds: 250)
    );
    Timer(Duration(seconds: 3), () {_controller.forward();});
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BackgroundImage(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Show group details accordingly
                    /*GroupBadge(width: 300,
                      image: GROUP_LOGOS[0],),
                    Text(GROUP_NAMES[0], style: Theme.of(context).textTheme.headline5, textScaleFactor: 2.5,),
                    Text(GROUP_TAGLINES[0],
                      textScaleFactor: 1, textAlign: TextAlign.center,
                    ),*/
                    SizedBox(height: 50),
                    FadeTransition(
                      opacity: _controller,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            SlideLeftRouteBounce(widget: HomePage())
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Theme.of(context).accentColor,
                            boxShadow: [
                              BoxShadow(color: Colors.pink[100], blurRadius: 5, offset: Offset(2,5), spreadRadius: 1)
                            ]
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text('GROUP ASSIGNED', textScaleFactor: 1, softWrap: true,),
                                  Text('GET STARTED', textScaleFactor: 1.5)
                                ],
                              ),
                              SizedBox(width: 40),
                              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 40,)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
