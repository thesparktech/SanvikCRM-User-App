import 'package:SanvikSystem/LayoutHome.dart';
import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout3/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'AppTheme.dart';
import 'AppThemeNotifier.dart';
import 'package:SanvikSystem/layout3/LoginScreen.dart' as login3;

import 'layout3/AppLayout.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    String langCode = await AllLanguage.getLanguage();
    await Translator.load(langCode);
    runApp(ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) {
        return AppThemeNotifier(context);
      },
      child: MyApp(),
    ));
  });
  //
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: login3.LoginScreen());
      },
    );
  }
}
