import 'package:SanvikSystem/AppTheme.dart';
import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout2/ShoppingFullApp2.dart';
import 'package:SanvikSystem/layout2/ShoppingPasswordScreen.dart';
import 'package:SanvikSystem/layout2/ShoppingRegisterScreen.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppThemeNotifier.dart';

class ShoppingLoginScreen extends StatefulWidget {
  @override
  _ShoppingLoginScreenState createState() => _ShoppingLoginScreenState();
}

class _ShoppingLoginScreenState extends State<ShoppingLoginScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                backgroundColor: themeData.scaffoldBackgroundColor,
                body: Container(
                  padding: EdgeInsets.only(
                      left: MySize.size24, right: MySize.size24),
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: Text(
                              Translator.translate("text_Welcome_Back") + " !",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.headline6,
                                  fontWeight: 600),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintText:
                                  Translator.translate("text_email_address"),
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: customAppTheme.bgLayer3,
                              prefixIcon: Icon(
                                MdiIcons.email,
                                size: MySize.size22,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16),
                          child: TextFormField(
                            autofocus: false,
                            obscureText: _passwordVisible,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 500),
                              hintText: Translator.translate("text_password"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: customAppTheme.bgLayer3,
                              prefixIcon: Icon(
                                MdiIcons.lock,
                                size: MySize.size22,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                child: Icon(
                                  _passwordVisible
                                      ? MdiIcons.eye
                                      : MdiIcons.eye,
                                  size: MySize.size22,
                                ),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16),
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingPasswordScreen()));
                            },
                            child: Text(
                              Translator.translate("text_forgot_password") +
                                  " ?",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontSize: 12,
                                  fontWeight: 500),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8)),
                            boxShadow: [
                              BoxShadow(
                                color: themeData.primaryColor.withAlpha(24),
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(MySize.size8)),
                            color: themeData.primaryColor,
                            splashColor: themeData.splashColor,
                            highlightColor: themeData.primaryColor,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingFullApp2()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  Translator.translate("text_sign_in")
                                      .toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600,
                                      letterSpacing: 0.5,
                                      color: themeData.colorScheme.onPrimary),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size24),
                                    child: Icon(
                                      MdiIcons.chevronRight,
                                      size: MySize.size18,
                                      color: themeData.colorScheme.onPrimary,
                                    ))
                              ],
                            ),
                            padding: EdgeInsets.only(
                                top: MySize.size12, bottom: MySize.size12),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShoppingRegisterScreen()));
                              },
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
                )));
      },
    );
  }
}
