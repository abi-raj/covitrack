import 'package:covitrack/screens/prescription/presCrad.dart';
import 'package:covitrack/utils/APIcalls.dart';
import 'package:flutter/material.dart';

class Prescription extends StatefulWidget {
  const Prescription({Key? key}) : super(key: key);

  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescriptions'),
      ),
      body: FutureBuilder(
        future: APITasks().getPrescription(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data['prescription'];
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return pCard(
                    data[index]['date'],
                    data[index]['id'],
                    data[index]['name'],
                    data[index]['quantity'],
                    data[index]['timing']);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
