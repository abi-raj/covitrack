import 'package:covitrack/screens/emergency/SosScreen.dart';
import 'package:covitrack/screens/home/cardWidget.dart';
import 'package:covitrack/screens/login/login.dart';
import 'package:covitrack/screens/symptoms/symptoms.dart';
import 'package:covitrack/utils/colorConst.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
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
                  Text('Hello'),
                  Text(
                    ' User!',
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
                            'Schedule an e-visit\nand discuss the plan\nwith a doctor',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: Image(
                        image: AssetImage('assets/mask.png'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.red,
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
                        card(Icons.medical_services, 'Diagnostic', () {}),
                        card(Icons.medical_services, 'Prescription', () {}),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        card(Icons.help_outline_rounded, 'Emergency', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SOSscreen()),
                          );
                        }),
                        card(Icons.person_pin, 'Profile', () {}),
                        card(Icons.logout, 'Logout', () {
                          Navigator.push(
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
