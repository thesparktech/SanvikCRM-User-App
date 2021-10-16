import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

final Map<String, String> environment = {
  'baseUrl': 'http://demoecomm.sparktech.tech/api'
};

getLanguage() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("languageId").toString();
}

checkLogin() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString("userSession");
}

getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  var data = prefs.getString("userSession");
  if (data != null) {
    var jsonData = json.decode(data);

    return jsonData;
  }
  return null;
}
