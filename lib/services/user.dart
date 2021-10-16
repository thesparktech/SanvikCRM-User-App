import 'dart:async';
import 'dart:io';

import 'package:SanvikSystem/config.dart';
import 'package:SanvikSystem/services/utility.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'ApiBaseHelper.dart';
import 'exception.dart';

class User {
  int userId;
  String firstName;
  String lastName;
  String email;
  int gender;
  DateTime dob;
  String username;
  String password;
  String mobileNo;
  ApiBaseHelper _helper = new ApiBaseHelper();
  Future<http.Response> registerUser(User user) async {
    try {
      var map = new Map<String, dynamic>();
      await getDeviceDetails().then((data) {
        map["device_brand"] = data['brand'].toString();
        map["device_model"] = data['model'].toString();
        map["os_version"] = data['version.release'].toString();
        map["os_name"] = Platform.operatingSystem;
      });
      map["prefix_id"] = "1";
      map["user_role_id"] = "2";
      map["username"] = user.username.toString();
      map["first_name"] = user.firstName.toString();
      map["last_name"] = user.lastName.toString();
      map["email_id"] = user.email.toString();
      map["mobile_no"] = user.mobileNo.toString();
      map["password"] = user.password.toString();

      http.Response response = await http.post(
          GlobalConfiguration().getString("baseUrl") + '/guest/registerUser',
          body: map);

      if (response.statusCode == 200) {
        print(response.body);
        return response;
      } else {
        throw FormatException('something_went_wrong');
      }
    } on SocketException {
      throw ('no_internet_connection');
    } on FormatException {
      throw ('server_error');
    } catch (e) {
      ;
      throw ('something_went_wrong');
    }
  }

  Future<http.Response> LoginUser(User user) async {
    try {
      String deviceToken;
      final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
      await _firebaseMessaging.getToken().then((token) => deviceToken = token);
      _firebaseMessaging.subscribeToTopic('appupdates');
      var map = new Map<String, dynamic>();
      await getDeviceDetails().then((data) {
        map["device_brand"] = data['brand'].toString();
        map["device_model"] = data['model'].toString();
        map["os_version"] = data['version.release'].toString();
        map["os_name"] = Platform.operatingSystem;
      });
      map["username"] = user.username.toString();
      map["password"] = user.password.toString();
      map["user_fcm_token"] = deviceToken;
      print(map);
      http.Response response = await http
          .post(GlobalConfiguration().getString("baseUrl") + '/guest/login',
              body: map)
          .timeout(const Duration(seconds: 30), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });

      if (response.statusCode == 200) {
        print(response.body);

        return response;
      } else {
        throw FormatException('something_went_wrong');
      }
    } on SocketException {
      throw ('no_internet_connection');
    } on FormatException {
      throw ('server_error');
    } on TimeoutException {
      throw ('connection_timed_out');
    } catch (e) {
      throw ('something_went_wrong');
    }
  }

  Future<dynamic> logoutUser() async {
    try {
      var map = new Map<String, dynamic>();
      var userData = await getUserData();
      map["api_token"] = userData['token'];
      final response = await http.post(
          GlobalConfiguration().getString("baseUrl") + "/logout",
          headers: {
            'Authorization': 'Bearer ' + userData['token'],
            "Accept": "application/json",
          },
          body: map);
      var responseJson = json.decode(response.body);
      print(response);
      return responseJson;
    } on AppException catch (e) {
      throw e;
    } on Exception {
      //sendReport(e.toString());
      throw ('something_went_wrong');
    } on Error catch (e) {
      //sendReport(e.toString());
      print(e.toString());
      throw ('something_went_wrong');
    }
  }

  Future<dynamic> logoutUserFromAllDevices(String token) async {
    try {
      var map = new Map<String, dynamic>();
      map["api_token"] = token;
      http.Response response = await http.post(
          GlobalConfiguration().getString("baseUrl") + '/logout',
          headers: {
            "Accept": "application/json",
          },
          body: map);
      if (response.statusCode != 200) {
        throw Exception('logout error');
      }
      var result = json.decode(response.body);

      return result;
    } on AppException catch (e) {
      throw e;
    } on Exception {
      //sendReport(e.toString());
      throw ('something_went_wrong');
    } on Error catch (e) {
      //sendReport(e.toString());
      print(e.toString());
      throw ('something_went_wrong');
    }
  }
}
