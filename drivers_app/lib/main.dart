import 'package:drivers_app/authentication/car_info_screen.dart';
import 'package:drivers_app/authentication/login_screen.dart';
import 'package:drivers_app/authentication/onbording.dart';
import 'package:drivers_app/authentication/welcome.dart';
import 'package:drivers_app/mainScreens/main_screen.dart';
import 'package:drivers_app/mainScreens/new_trip_screen.dart';
import 'package:drivers_app/mainScreens/trips_history_screen.dart';
import 'package:drivers_app/push_notifications/notification_dialog_box%20(1).dart';
import 'package:drivers_app/splashScreen/splash_screen.dart';
import 'package:drivers_app/tabPages/earning_tab.dart';
import 'package:drivers_app/tabPages/home_tab.dart';
import 'package:drivers_app/tabPages/profile_tab.dart';
import 'package:drivers_app/tabPages/ratings_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'infoHandler/app_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyApp(
      child: ChangeNotifierProvider(
        create: (context) => AppInfo(),
        child: MaterialApp(
          title: 'Drivers App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MySplashScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget? child;

  MyApp({this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
