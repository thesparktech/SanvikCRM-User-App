import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import 'exception.dart';

class ApiBaseHelper {
  final String _baseUrl = GlobalConfiguration().getString("baseUrl");

  Future<dynamic> getPublic(String url) async {
    var userData = await getUserData();

    var responseJson;

    try {
      final response = await http.get(_baseUrl + "/guest" + url);
      responseJson = _returnResponse(response);
      print(responseJson);
      if (responseJson['success'] == 0) {
        //throw DataNotFoundException("data_not_found");
      }
    } on SocketException {
      throw NoInternetException('no_internet_connection');
    } on FormatException {
      throw InvalidResponseException('server_error');
    }

    return responseJson['data'];
  }

  Future<dynamic> getPrivate(String url) async {
    var userData = await getUserData();
    var responseJson;

    try {
      final response = await http.get(_baseUrl + url, headers: {
        'Authorization': 'Bearer ' + userData['token'],
        "Accept": "application/json"
      });
      responseJson = _returnResponse(response);
      print(responseJson);
      if (responseJson['success'] == 0 && responseJson['status_code'] == 200) {
        //throw DataNotFoundException("data_not_found");
      } else if (responseJson['status_code'] == 401) {
        throw UnauthorizedException("invalid_login");
      }
    } on SocketException {
      throw NoInternetException('no_internet_connection');
    } on FormatException {
      throw InvalidResponseException('server_error');
    }

    return responseJson['data'];
  }

  Future<dynamic> post(String url, data) async {
    var userData = await getUserData();
    var responseJson;
    try {
      print(data);
      final response = await http.post(_baseUrl + url,
          headers: {
            'Authorization': 'Bearer ' + userData['token'],
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
          body: data);
      print(response.body);
      responseJson = _returnResponse(response);
      if (responseJson['success'] == 0 && responseJson['status_code'] == 200) {
        throw DataNotFoundException("something_went_wrong");
      } else if (responseJson['status_code'] == 401) {
        throw UnauthorizedException("invalid_login");
      }
    } on SocketException {
      throw NoInternetException('no_internet_connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        print(response);
        var responseJson = json.decode(response.body);
        return responseJson;
      case 500:
        throw InvalidResponseException("server_error");
      case 401:
        throw UnauthorizedException("invalid_login");
      default:
        throw ('something_went_wrong');
    }
  }
}
