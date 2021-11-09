import 'package:covitrack/screens/login/login.dart';

import 'package:covitrack/utils/SharedPrefs.dart';
import 'package:flutter/material.dart';

import 'screens/home/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Decider(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class Decider extends StatelessWidget {
  const Decider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isLogin(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true)
              return HomeScreen();
            else {
              return LoginScreen();
            }
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
