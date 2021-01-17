import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:iiitb_hogwarts/screens/home_page.dart';
import 'package:iiitb_hogwarts/screens/login_page.dart';
import 'package:iiitb_hogwarts/services/current_user.dart';
import 'package:iiitb_hogwarts/widgets/Theme.dart';
import 'package:iiitb_hogwarts/widgets/splash_screen.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    precacheImage(AssetImage('images/background.jpg'), context);
    return MultiProvider(
        providers: [
          Provider(create: (context) => User())
        ],
        builder: (context, _) {
          final User user = Provider.of<User>(context, listen: false);
          return MaterialApp(
            title: 'IIITB-Hogwarts',
            theme: ourTheme(),
            debugShowCheckedModeBanner: false,
            home: FutureBuilder(
                future: getUser(user),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return SplashScreen();
                  return (snapshot.hasData && snapshot.data)
                      ? HomePage()
                      : HomePage();
                }),
          );
        });
  }
}
