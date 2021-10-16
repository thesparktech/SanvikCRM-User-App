import 'package:SanvikSystem/SelectThemeDialog.dart';
import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/screens/ChatScreen.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                body: ListView(
              padding: EdgeInsets.all(MySize.size24),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: MySize.size16),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MySize.size64,
                        height: MySize.size64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage("./assets/profile/avatar-2.jpg"),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: MySize.size16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Deniyo Preece",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0)),
                            Text("den@shopy.com",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight: 600,
                                    letterSpacing: 0.3)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: Icon(
                              MdiIcons.chevronRight,
                              color: themeData.colorScheme.onBackground,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size40),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(MySize.size16),
                          margin: EdgeInsets.only(right: MySize.size12),
                          decoration: BoxDecoration(
                            color: themeData.cardTheme.color,
                            border: Border.all(
                                width: 0.5,
                                color: themeData.colorScheme.surface),
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8)),
                            boxShadow: [
                              BoxShadow(
                                color: themeData.cardTheme.shadowColor
                                    .withAlpha(18),
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                MdiIcons.mapMarkerOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: MySize.size8),
                                  child: Text(
                                    Translator.translate("text_address"),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 700),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(MySize.size16),
                          margin: EdgeInsets.only(
                              left: MySize.size4, right: MySize.size4),
                          decoration: BoxDecoration(
                            color: themeData.cardTheme.color,
                            border: Border.all(
                                width: 0.5,
                                color: themeData.colorScheme.surface),
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8)),
                            boxShadow: [
                              BoxShadow(
                                color: themeData.cardTheme.shadowColor
                                    .withAlpha(18),
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                MdiIcons.creditCardOutline,
                                color: themeData.colorScheme.onBackground,
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: MySize.size8),
                                  child: Text(
                                    Translator.translate("text_payment"),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 700),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(MySize.size16),
                          margin: EdgeInsets.only(left: MySize.size12),
                          decoration: BoxDecoration(
                            color: themeData.cardTheme.color,
                            border: Border.all(
                                width: 0.5,
                                color: themeData.colorScheme.surface),
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8)),
                            boxShadow: [
                              BoxShadow(
                                color: themeData.cardTheme.shadowColor
                                    .withAlpha(18),
                                blurRadius: 3,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                MdiIcons.contentPaste,
                                color: themeData.colorScheme.onBackground,
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: MySize.size8),
                                  child: Text(
                                    Translator.translate("text_history"),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 600),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size40),
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(MdiIcons.heartOutline,
                                size: MySize.size22,
                                color: themeData.colorScheme.onBackground),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.size16),
                              child: Text(
                                  Translator.translate("text_favourite"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 600)),
                            ),
                          ),
                          Container(
                            child: Icon(MdiIcons.chevronRight,
                                size: MySize.size22,
                                color: themeData.colorScheme.onBackground),
                          ),
                        ],
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: MySize.size8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(
                                MdiIcons.bellRingOutline,
                                size: MySize.size22,
                                color: themeData.colorScheme.onBackground,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: MySize.size16),
                                child: Text(
                                    Translator.translate("text_notification"),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        fontWeight: 600)),
                              ),
                            ),
                            Container(
                              child: Icon(MdiIcons.chevronRight,
                                  size: MySize.size22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: MySize.size8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(MdiIcons.eyeOutline,
                                  size: MySize.size22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SelectThemeDialog());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: MySize.size16),
                                  child: Text(
                                      Translator.translate("text_appearance"),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          fontWeight: 600)),
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(MdiIcons.chevronRight,
                                  size: MySize.size22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: MySize.size8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(MdiIcons.faceAgent,
                                  size: MySize.size22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: MySize.size16),
                                  child: Text(
                                      Translator.translate("text_help") +
                                          " \& " +
                                          Translator.translate("text_support"),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          fontWeight: 600)),
                                ),
                              ),
                            ),
                            Container(
                              child: Icon(MdiIcons.chevronRight,
                                  size: MySize.size22,
                                  color: themeData.colorScheme.onBackground),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size24, bottom: MySize.size8),
                        child: Center(
                          child: Text(
                            Translator.translate(
                                "text_more_screens_are_coming_soon"),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 500),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
      },
    );
  }
}
