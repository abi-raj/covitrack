import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class APITasks {
  Future checkLogin(email, phone) async {
    final response = await http.post(
      Uri.parse('https://covitrack.azurewebsites.net/checkUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'mobile': phone,
      }),
    );

    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status'] == true) {
        return true;
      }
    }

    return false;
  }

  Future addEmergency(email) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String date = formatter.format(now);

    final response = await http.post(
      Uri.parse('https://covitrack.azurewebsites.net/addEmergency'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
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

  Future getPrescription(email) async {
    final response = await http.post(
      Uri.parse('https://covitrack.azurewebsites.net/getPrescription'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['status'] == "success") {
        print(jsonDecode(response.body)['pres']);
        return jsonDecode(response.body)['pres'];
      }
    }

    return null;
  }
}
