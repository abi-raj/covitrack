import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getBool('isLogin') ?? false;
}

Future locLogin(id, name, age, area, image, gender) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLogin', true);
  prefs.setInt('id', id);
  prefs.setString('name', name);
  prefs.setInt('age', age);
  prefs.setString('area', area);
  prefs.setString('image', image);
  prefs.setString('gender', gender);
}

Future locLogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

Future<Map<String, String>> getAll() async {
  Map<String, String> map = {};
  SharedPreferences prefs = await SharedPreferences.getInstance();
  map['id'] = prefs.getInt('id').toString();
  map['name'] = prefs.getString('name')!;
  map['age'] = prefs.getInt('age').toString();
  map['area'] = prefs.getString('area')!;
  map['image'] = prefs.getString('image')!;
  map['gender'] = prefs.getString('gender')!;
  return map;
}
