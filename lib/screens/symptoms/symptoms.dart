import 'package:covitrack/screens/home/Home.dart';
import 'package:covitrack/utils/APIcalls.dart';
import 'package:flutter/material.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  Map<String, bool> symp = {
    "cough": false,
    "fever": false,
    "soreThroat": false,
    "headache": false,
    "runnyNose": false,
    "bodyAche": false,
    "shortnessOfBreath": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnostics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Daily Check',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Check the symptoms you experience :',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              child: Column(
                children: [
                  checkList('Cough', 'cough'),
                  checkList('Fever', 'fever'),
                  checkList('Sore Throat', 'soreThroat'),
                  checkList('Shortness of Breath', 'shortnessOfBreath'),
                  checkList('Body Ache', 'bodyAche'),
                  checkList('Headache', 'headache'),
                  checkList('Runny Nose', 'runnyNose'),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  int count = 0;
                  for (var s in symp.keys) {
                    if (symp[s] == true) {
                      count++;
                    }
                  }
                  int res = 100 - (count / 7 * 100).round();
                  print(res);
                  await APITasks().addDailyScore(res);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkList(title, val) {
    return Container(
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? value) {
          setState(() {
            symp[val] = value!;
          });
        },
        value: symp[val],
        title: Text(title),
      ),
    );
  }
}
