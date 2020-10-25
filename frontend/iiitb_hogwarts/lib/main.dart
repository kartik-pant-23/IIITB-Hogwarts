import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iiitb_hogwarts/screens/home_page.dart';
import 'package:iiitb_hogwarts/screens/login_page.dart';
import 'package:iiitb_hogwarts/services/current_user.dart';
import 'package:iiitb_hogwarts/widgets/Theme.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/background.jpg'), context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User()),
      ],
      child: MaterialApp(
        title: 'IIITB-Hogwarts',
        theme: ourTheme(),
        home: FutureBuilder(
            future: getUser(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting)
                return Scaffold(body: Center(child: SizedBox(height: 100, width: 100,
                  child: SvgPicture.asset('images/ic_default_profile.svg', fit: BoxFit.cover,))));
              return (snapshot.hasData && snapshot.data) ?HomePage() :LoginPage();
            }
        ),
      ),
    );
  }
}
