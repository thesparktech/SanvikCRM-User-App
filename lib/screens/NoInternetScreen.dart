import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class NoInternetScreen extends StatefulWidget {
  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: themeData.scaffoldBackgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                ),
                backgroundColor: themeData.backgroundColor,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Icon(
                        MdiIcons.wifiStrengthOffOutline,
                        size: MySize.size64,
                        color: themeData.colorScheme.primary,
                      )),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24),
                        child: Text(
                          Translator.translate('text_whoops'),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline6,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600,
                              letterSpacing: 0.2),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24),
                        child: Column(
                          children: <Widget>[
                            Text(
                              Translator.translate(
                                      "text_slow_or_no_internet_connection") +
                                  ".",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  letterSpacing: 0,
                                  fontWeight: 500),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size4),
                              child: Text(
                                Translator.translate(
                                    "text_please_check_your_internet_settings"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    letterSpacing: 0,
                                    fontWeight: 500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.colorScheme.primary.withAlpha(20),
                              blurRadius: 3,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(MySize.size4)),
                            color: themeData.colorScheme.primary,
                            padding: EdgeInsets.only(
                                left: MySize.size32, right: MySize.size32),
                            splashColor: Colors.white,
                            onPressed: () {},
                            child: Text(Translator.translate("text_try_again"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.button,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary,
                                    letterSpacing: 0.5))),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}
