import 'dart:async';
import 'dart:convert';

import 'package:SanvikSystem/app_localizations.dart';
import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:package_info/package_info.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';

RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]},';
final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
showToast(text, context) {
  Toast.show(text, context,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM,
      textColor: Colors.black,
      backgroundColor: Colors.grey[300].withOpacity(0.8));
}

Widget deleteDialog(context) {
  return AlertDialog(
    content: Wrap(
      children: <Widget>[
        Text(Translator.translate("are_you_sure_want_to_delete").toString())
      ],
    ),
    actions: <Widget>[
      FlatButton(
        child: Text(Translator.translate("cancel").toString()),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      RaisedButton(
        color: Colors.green,
        child: Text(Translator.translate("yes_delete").toString()),
        onPressed: () async {
          showToast(Translator.translate("deleting").toString(), context);
          Navigator.of(context).pop('delete');
        },
      )
    ],
  );
}

Widget confirmOrderDialog(context) {
  return AlertDialog(
    content: Wrap(
      children: <Widget>[
        Text(Translator.translate("confirm_order").toString())
      ],
    ),
    actions: <Widget>[
      FlatButton(
        child: Text(Translator.translate("cancel").toString()),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      RaisedButton(
        color: Colors.green,
        child: Text(Translator.translate("yes_confirm").toString()),
        onPressed: () async {
          //showToast("Placing order...", context);
          Navigator.of(context).pop('yes');
        },
      )
    ],
  );
}

checkInternet(context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());

  if (connectivityResult == ConnectivityResult.none) {
    Flushbar(
      message: Translator.translate("no_internet_connection").toString(),
      duration: Duration(seconds: 3),
    ).show(context);
  }
}

String removeDecimalZeroFormat(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<http.Response> sendReport(result) async {
  Map<String, dynamic> deviceData;

  //sendMail();
  deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
  var userData = await getUserData();
  final String apiUrl =
      GlobalConfiguration().getString("baseUrl") + "/reportErrorLog";

  Map responseMap = new Map<String, dynamic>();
  responseMap['device_info'] = deviceData;
  print(result);
  responseMap['error'] = result.toString();
  //
  var jsonData = json.encode(responseMap);
  var response = await http.post(apiUrl,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonData);
  print("h" + response.body);
  return response;
}

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  var deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
  return packageInfo.version;
}

Future<Map<String, dynamic>> getDeviceDetails() async {
  var deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
  return deviceData;
}

Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  print(<String, dynamic>{
    'version.securityPatch': build.version.securityPatch,
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.previewSdkInt': build.version.previewSdkInt,
    'version.incremental': build.version.incremental,
    'version.codename': build.version.codename,
    'version.baseOS': build.version.baseOS,
    'board': build.board,
    'bootloader': build.bootloader,
    'brand': build.brand,
    'device': build.device,
    'display': build.display,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'product': build.product,
    'tags': build.tags,
    'type': build.type,
    'isPhysicalDevice': build.isPhysicalDevice,
    'androidId': build.androidId,
    'systemFeatures': build.systemFeatures,
  });
  return <String, dynamic>{
    'version.sdkInt': build.version.sdkInt,
    'version.release': build.version.release,
    'version.baseOS': build.version.baseOS,
    'brand': build.brand,
    'device': build.device,
    'hardware': build.hardware,
    'host': build.host,
    'id': build.id,
    'manufacturer': build.manufacturer,
    'model': build.model,
    'isPhysicalDevice': build.isPhysicalDevice,
    'androidId': build.androidId,
  };
}

Widget timerWidget() {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 60;

  int currentSeconds = 0;

  String timerText =
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  return StatefulBuilder(builder: (context, setState) {
    startTimeout([int milliseconds]) {
      var duration = interval;
      Timer.periodic(duration, (timer) {
        setState(() {
          print(timer.tick);
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) timer.cancel();
        });
      });
      return Text(timerText.toString());
    }
  });
}

ProgressDialog showProcess(String message, context) {
  ProgressDialog orderProgress;
  orderProgress = new ProgressDialog(context,
      type: ProgressDialogType.Normal, isDismissible: false);
  orderProgress.style(
      borderRadius: 2,
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(13),
        child: CircularProgressIndicator(
          strokeWidth: 3,
        ),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(color: Colors.black, fontSize: 11.0),
      messageTextStyle: TextStyle(color: Colors.black54, fontSize: 16.0));
  return orderProgress;
}
