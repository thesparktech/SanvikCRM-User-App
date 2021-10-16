import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout2/ShoppingCategoryScreen.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:SanvikSystem/layout2/ShoppingProfileEdit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import '../SelectThemeDialog.dart';

class ShoppingSettingScreen extends StatefulWidget {
  @override
  _ShoppingSettingScreenState createState() => _ShoppingSettingScreenState();
}

class _ShoppingSettingScreenState extends State<ShoppingSettingScreen>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  bool _showNotification = true;
  bool _orderDeliver = true;
  bool _tips = false;

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                backgroundColor: customAppTheme.bgLayer2,
                body: Container(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MySize.size24, right: MySize.size24),
                    color: customAppTheme.bgLayer2,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: MySize.size64,
                                height: MySize.size64,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "./assets/profile/avatar-1.jpg"),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: MySize.size16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Lindsey Morris",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle1,
                                              fontWeight: 600,
                                              letterSpacing: 0)),
                                      Text("lind@mail.my",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontWeight: 500,
                                              muted: true,
                                              letterSpacing: 0.3)),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MySize.size16),
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(MySize.size4)),
                                  color: themeData.colorScheme.primary,
                                  splashColor: Colors.white.withAlpha(100),
                                  highlightColor: themeData.colorScheme.primary,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShoppingProfileEdit()));
                                  },
                                  child: Text(
                                    Translator.translate("text_edit"),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 600,
                                        letterSpacing: 0.2,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size40),
                          child: Text(
                              Translator.translate("text_general")
                                  .toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.onBackground,
                                  muted: true,
                                  letterSpacing: 0.2)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size8),
                          padding: EdgeInsets.symmetric(vertical: MySize.size8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingCategoryScreen()));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      Translator.translate("text_category"),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          fontWeight: 600)),
                                ),
                                Container(
                                  child: Icon(MdiIcons.chevronRight,
                                      size: 24,
                                      color:
                                          themeData.colorScheme.onBackground),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    SelectThemeDialog());
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: MySize.size8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      Translator.translate("text_appearance"),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          letterSpacing: 0.0,
                                          fontWeight: 600)),
                                ),
                                Container(
                                  child: Icon(MdiIcons.chevronRight,
                                      size: MySize.size24,
                                      color:
                                          themeData.colorScheme.onBackground),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size40),
                          child: Text(
                              Translator.translate("text_notification_setting")
                                  .toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight: 600,
                                  color: themeData.colorScheme.onBackground,
                                  muted: true,
                                  letterSpacing: 0.2)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size8),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                    Translator.translate(
                                        "text_Show_All_Notifications"),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        letterSpacing: 0.0,
                                        fontWeight: 600)),
                              ),
                              Switch(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                onChanged: (bool value) {
                                  setState(() {
                                    _showNotification = value;
                                  });
                                },
                                value: _showNotification,
                                activeColor: themeData.colorScheme.primary,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  Translator.translate("text_Order_Deliver"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600)),
                            ),
                            Switch(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (bool value) {
                                setState(() {
                                  _orderDeliver = value;
                                });
                              },
                              value: _orderDeliver,
                              activeColor: themeData.colorScheme.primary,
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  Translator.translate(
                                      "text_Offers_and_Discount"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 600)),
                            ),
                            Switch(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              onChanged: (bool value) {
                                setState(() {
                                  _tips = value;
                                });
                              },
                              value: _tips,
                              activeColor: themeData.colorScheme.primary,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
