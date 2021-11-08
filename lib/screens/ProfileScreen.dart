import 'package:covitrack/utils/SharedPrefs.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Map<String, String>>(
          future: getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;

              print(data);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(data['image']!),
                  ),
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text(data['name']!),
                  ),
                  ListTile(
                    title: Text('Age'),
                    subtitle: Text(data['age']!),
                  ),
                  ListTile(
                    title: Text('Gender'),
                    subtitle: Text(data['gender']!),
                  ),
                  ListTile(
                    title: Text('Address'),
                    subtitle: Text(data['area']!),
                  ),
                ],
              );
            } else {
              return (Center(
                child: CircularProgressIndicator(),
              ));
            }
          },
        ),
      ),
    );
  }
}
