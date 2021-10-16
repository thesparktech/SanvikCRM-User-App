import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout3/AppLayout.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import 'RegisterScreen.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: Container(
              padding: EdgeInsets.only(top: MySize.size48),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(
                                  left: MySize.size16, right: MySize.size16),
                              child: Center(
                                child: Text(
                                  Translator.translate("text_Reset_Password"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline5,
                                      fontWeight: 700),
                                ),
                              )),
                          Container(
                            margin: EdgeInsets.only(
                                left: MySize.size48,
                                right: MySize.size48,
                                top: MySize.size40),
                            child: Text(
                              Translator.translate(
                                  "text_enter_your_email_address_to_reset_your_password"),
                              softWrap: true,
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600,
                                  height: 1.2,
                                  color: themeData.colorScheme.onBackground
                                      .withAlpha(200)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: MySize.size24,
                                right: MySize.size24,
                                top: MySize.size36),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: themeData.cardTheme.color,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size16)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 8.0,
                                        color: themeData.cardTheme.shadowColor
                                            .withAlpha(25),
                                        offset: Offset(0, 3)),
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600,
                                        letterSpacing: 0.2),
                                    decoration: InputDecoration(
                                      hintStyle: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          fontWeight: 600,
                                          letterSpacing: 0,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(180)),
                                      hintText: Translator.translate(
                                          "text_email_address"),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(16),
                                    ),
                                    autofocus: false,
                                    textInputAction: TextInputAction.search,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  left: MySize.size24,
                                  right: MySize.size24,
                                  top: MySize.size36),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(48)),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          themeData.primaryColor.withAlpha(100),
                                      blurRadius: 5,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(MySize.size16)),
                                  color: themeData.colorScheme.primary,
                                  highlightColor: themeData.colorScheme.primary,
                                  splashColor: Colors.white.withAlpha(100),
                                  padding: EdgeInsets.only(
                                      top: MySize.size16,
                                      bottom: MySize.size16),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AppLayout()));
                                  },
                                  child: Stack(
                                    overflow: Overflow.visible,
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          Translator.translate(
                                                  "text_Reset_Password")
                                              .toUpperCase(),
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              letterSpacing: 0.6,
                                              fontWeight: 800),
                                        ),
                                      ),
                                      Positioned(
                                        right: MySize.size16,
                                        child: ClipOval(
                                          child: Container(
                                            color: themeData
                                                .colorScheme.primaryVariant,
                                            // button color
                                            child: SizedBox(
                                                width: MySize.size30,
                                                height: MySize.size30,
                                                child: Icon(
                                                  MdiIcons.arrowRight,
                                                  color: themeData
                                                      .colorScheme.onPrimary,
                                                  size: 18,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: Center(
                                child: Text(
                                  Translator.translate(
                                      "text_i_have_not_an_account"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
      },
    );
  }
}
