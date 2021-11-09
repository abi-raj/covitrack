import 'package:covitrack/screens/emergency/SosScreen.dart';
import 'package:covitrack/screens/home/cardWidget.dart';
import 'package:covitrack/screens/login/login.dart';
import 'package:covitrack/screens/symptoms/symptoms.dart';

import 'package:covitrack/utils/SharedPrefs.dart';
import 'package:covitrack/utils/colorConst.dart';
import 'package:covitrack/utils/notificationsApi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ProfileScreen.dart';
import '../prescription/PrescriptionScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = 'User';

  @override
  void initState() {
    NotificationsApi.initialize();
    setName();
    listenNotifications();
    super.initState();
  }

  void listenNotifications() {
    NotificationsApi.onNotifications.stream.listen((event) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Prescription()),
      );
    });
  }

  void setName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'User';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    icon: Icon(Icons.person_pin_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                  ),
                ],
              ),
//name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello,'),
                  Text(
                    '$name!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              //card

              Container(
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: primaryDark.withOpacity(.8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Stay home!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'You are strong enough\nto fight through this.\nLet\'s beat Covid-19!.',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      child: Image(
                        image: AssetImage('assets/mask.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              //textField
              Text(
                'What do you need?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        card(Icons.medical_services, 'Diagnostic', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SymptomsScreen()),
                          );
                        }),
                        card(Icons.help_outline_rounded, 'Emergency', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SOSscreen()),
                          );
                        }),
                        card(Icons.note_alt_sharp, 'Prescription', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Prescription()),
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        card(Icons.electrical_services, 'Services', () {
                          NotificationsApi.imageNotification();
                        }),
                        card(Icons.person_pin, 'Profile', () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                        }),
                        card(Icons.logout, 'Logout', () async {
                          await locLogout();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
