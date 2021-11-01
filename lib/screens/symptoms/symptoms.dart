import 'package:flutter/material.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms'),
      ),
      body: Column(
        children: [
          Text('Daily Check'),
          Text('Check the symptoms you experience'),
          checkList(),
        ],
      ),
    );
  }

  checkList() {
    return Container(
      child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (bool? value) {},
          value: true,
          title: Text('Check')),
    );
  }
}
