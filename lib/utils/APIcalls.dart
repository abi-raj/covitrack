import 'dart:convert';

import 'package:http/http.dart' as http;

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
}
