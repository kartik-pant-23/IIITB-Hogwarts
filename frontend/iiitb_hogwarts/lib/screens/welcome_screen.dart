import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iiitb_hogwarts/models/user.dart';
import 'package:iiitb_hogwarts/screens/show_group.dart';
import 'package:iiitb_hogwarts/widgets/background_image.dart';
import 'package:iiitb_hogwarts/widgets/transition.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with TickerProviderStateMixin{

  AnimationController _titleText1, _titleText2, _headerText, _icHat, _options;
  final options = [
    ['Learning', 'Earning by learning', 'Learning for earning'],
    ['Placement', 'Friends', 'Memories'],
    ['Initiating a change', 'Supporting a change', 'I don\'t give a ..']
  ];
  int _currentOption = 0;
  Color _colorOption1 = Color(0xFFDF267C).withOpacity(0.40),
      _colorOption2 = Color(0xFFDF267C).withOpacity(0.40),
      _colorOption3 = Color(0xFFDF267C).withOpacity(0.40);
  bool _absorbing = false;

  @override
  void initState() {
    _headerText = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _icHat = AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _titleText1 = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _titleText2 = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _options = AnimationController(vsync: this, duration: Duration(milliseconds: 50));
    Timer(Duration(milliseconds: 200), () {_icHat.forward();});
    Timer(Duration(seconds: 1), () {_headerText.forward();});
    Timer(Duration(seconds: 3), () {_titleText1.forward();});
    Timer(Duration(seconds: 4), () {_titleText2.forward();});
    Timer(Duration(seconds: 5), () {_options.forward();});
    super.initState();
  }

  @override
  void dispose() {
    _titleText1.dispose(); _titleText2.dispose();
    _headerText.dispose(); _icHat.dispose(); _options.dispose();
    super.dispose();
  }

  Widget _pageHeader() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: FadeTransition(
            opacity: _headerText,
            child: Consumer<User>(
              builder: (context, user, _) {
                return Text('Hi ${user.name.split(' ')[0]}!\nWelcome to the wizarding world',
                  style: TextStyle(fontFamily: "Harry Potter", fontSize: 24),
                  textAlign: TextAlign.center,);
              },
            ),
          ),
        ),
        SizedBox(
          height: 120,
          width: 120,
          child: SlideTransition(
            position: Tween<Offset>(
                begin: Offset(-2, 0),
                end: Offset.zero
            ).animate(_icHat),
            child: SvgPicture.asset('images/witch_hat.svg', fit: BoxFit.fill, color: Colors.white,),
          ),
        )
      ],
    );
  }

  Widget _titleTextWidget1() {
    return FadeTransition(
      opacity: _titleText1,
      child: Text(
        'Hmm... Let\'s know you first.',
        style: TextStyle(fontFamily: 'Harry Potter', fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _titleTextWidget2() {
    return FadeTransition(
      opacity: _titleText2,
      child: Text(
        'What drives you more?',
        style: TextStyle(fontFamily: 'Harry Potter', fontSize: 24),
        textAlign: TextAlign.center
      ),
    );
  }

  Widget _optionsWidget() {
    return FadeTransition(
      opacity: _options,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _absorbing=true;
                _colorOption1 = Theme
                    .of(context)
                    .accentColor;
              });
              if(_currentOption==2) { navigateToShowGroup(); }
              else {
                Timer(Duration(seconds: 1), () {
                  setState(() {
                    _absorbing=false;
                    _colorOption1 = Theme
                        .of(context)
                        .accentColor
                        .withOpacity(0.40);
                    _currentOption++;
                  });
                });
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: _colorOption1,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide.none)
              ),
              child: Text(options[_currentOption][0], style: Theme.of(context).textTheme.bodyText2,),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _absorbing = true;
                _colorOption2 = Theme
                    .of(context)
                    .accentColor;
              });
              if(_currentOption==2){ navigateToShowGroup(); }
              else {
                Timer(Duration(seconds: 1), () {
                  _absorbing = false;
                  setState(() {
                    _colorOption2 = Theme
                        .of(context)
                        .accentColor
                        .withOpacity(0.40);
                    _currentOption++;
                  });
                });
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: _colorOption2,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.fromBorderSide(BorderSide.none)
              ),
              child: Text(options[_currentOption][1], style: Theme.of(context).textTheme.bodyText2,),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _absorbing = true;
                _colorOption3 = Theme
                    .of(context)
                    .accentColor;
              });
              if(_currentOption==2){ navigateToShowGroup(); }
              else {
                Timer(Duration(seconds: 1), () {
                  setState(() {
                    _absorbing = false;
                    _colorOption3 = Theme
                        .of(context)
                        .accentColor
                        .withOpacity(0.40);
                    _currentOption++;
                  });
                });
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: _colorOption3,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.fromBorderSide(BorderSide.none)
              ),
              child: Text(options[_currentOption][2], style: Theme.of(context).textTheme.bodyText2,),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _pageHeader(),
                SizedBox(height: 10),
                _titleTextWidget1(),
                SizedBox(height: 100),
                _titleTextWidget2(),
                SizedBox(height: 20),
                AbsorbPointer(
                  absorbing: _absorbing,
                  child: _optionsWidget())
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToShowGroup()  {
    Timer(Duration(seconds: 1),() {
      //Navigator.of(context).pushReplacement(SlideLeftRoute(widget: ShowGroup()));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return ShowGroup();
      }));
    });
  }
}
