import 'dart:convert';

import 'package:covitrack/utils/SharedPrefs.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APITasks {
  Future checkLogin(id, email) async {
    final response = await http.post(
      Uri.parse('https://covitrack.azurewebsites.net/api/checkUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status'] == true) {
        final body = jsonDecode(response.body);
        await locLogin((body['id']), body['name'], body['age'], body['area'],
            body['image'], body['gender']);
        return true;
      }
    }

    return false;
  }

  Future addEmergency() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final name = prefs.getString('name');
    final age = prefs.getInt('age');
    final area = prefs.getString('area');
    int id = prefs.getInt('id')!;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String date = formatter.format(now);
    final DateFormat formatter2 = DateFormat('HH:mm');
    final String time = formatter2.format(now);

    final response = await http.post(
      Uri.parse('https://covitrack.azurewebsites.net/api/addEmergency'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "pid": '$id',
        "name": name!,
        "age": '$age',
        "area": area!,
        "date": date,
        "time": time,
        "status": "Pending",
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status'] == "success") {
        return true;
      }
    }

    return false;
  }

  Future getPrescription() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('id');
    final response = await http.get(
      Uri.parse(
          'https://covitrack.azurewebsites.net/api/IndividualPrescription/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      return (jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future addDailyScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id')!;
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String date = formatter.format(now);

    final response = await http.post(
      Uri.parse('https://covitrack.azurewebsites.net/api/addDailyScore'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'pid': '$id',
        'score': '$score',
        'date': date,
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status'] == "success") {
        return true;
      }
    }
    return false;
  }
}
