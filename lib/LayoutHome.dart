import 'package:SanvikSystem/SelectLanguageDialog.dart';
import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout1/ShoppingLoginScreen.dart' as login1;
import 'package:SanvikSystem/layout2/ShoppingLoginScreen.dart' as login2;
import 'package:SanvikSystem/layout3/LoginScreen.dart' as login3;
import 'package:SanvikSystem/onboarding/ShoppingOnboarding2Screen.dart';
import 'package:SanvikSystem/onboarding/ShoppingOnboardingScreen.dart';
import 'package:SanvikSystem/screens/ScreensHome.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppTheme.dart';
import 'AppThemeNotifier.dart';
import 'SelectThemeDialog.dart';

class LayoutHome extends StatefulWidget {
  @override
  _WidgetsHomeState createState() => _WidgetsHomeState();
}

class _WidgetsHomeState extends State<LayoutHome> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    MySize().init(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  //backgroundColor: customAppTheme.bgLayer2,
                  elevation: 0,
                  title: Text("Shopping",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                drawer: Drawer(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: DrawerHeader(
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.all(0),
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: MySize.size16, bottom: MySize.size8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                          child: Container(
                                        child: Image(
                                            image: AssetImage(
                                                "./assets/logo/logo.png"),
                                            height:
                                                MySize.getScaledSizeHeight(102),
                                            width:
                                                MySize.getScaledSizeHeight(102),
                                            color: themeData
                                                .colorScheme.onPrimary),
                                      ))),
                                  Column(
                                    children: <Widget>[
                                      Text("v. 1.0.0",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              fontWeight: 600))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          decoration:
                              BoxDecoration(color: themeData.primaryColor),
                        ),
                      ),
                      Container(
                        color: themeData.backgroundColor,
                        child: ListTile(
                          onTap: () {
                            _scaffoldKey.currentState.openEndDrawer();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    SelectThemeDialog());
                          },
                          title: Text(
                            "Select Theme",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600),
                          ),
                          trailing: Icon(Icons.chevron_right,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                      Container(
                        color: themeData.backgroundColor,
                        child: ListTile(
                          onTap: () {
                            _scaffoldKey.currentState.openEndDrawer();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    SelectLanguageDialog());
                          },
                          title: Text(
                            "Select Language",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600),
                          ),
                          trailing: Icon(Icons.chevron_right,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          color: themeData.backgroundColor,
                        ),
                      )
                    ],
                  ),
                )),
                backgroundColor: customAppTheme.bgLayer2,
                body: Container(
                  color: customAppTheme.bgLayer2,
                  child: ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.all(MySize.size16),
                        mainAxisSpacing: MySize.size16,
                        childAspectRatio: 1.25,
                        crossAxisSpacing: MySize.size16,
                        children: <Widget>[
                          SinglePageItem(
                            icon: './assets/icons/rocket-outline.png',
                            navigation: ShoppingOnboardingScreen(),
                            title:
                                Translator.translate("text_onboarding") + " 1",
                          ),
                          SinglePageItem(
                            icon: './assets/icons/rocket-outline.png',
                            navigation: ShoppingOnboarding2Screen(),
                            title:
                                Translator.translate("text_onboarding") + " 2",
                          ),
                          SinglePageItem(
                            icon: './assets/icons/albums-outline.png',
                            navigation: login1.ShoppingLoginScreen(),
                            title: Translator.translate("text_layout") + " 1",
                          ),
                          SinglePageItem(
                            icon: './assets/icons/albums-outline.png',
                            navigation: login2.ShoppingLoginScreen(),
                            title: Translator.translate("text_layout") + " 2",
                          ),
                          SinglePageItem(
                            icon: './assets/icons/albums-outline.png',
                            navigation: login3.LoginScreen(),
                            title: Translator.translate("text_layout") + " 3",
                          ),
                          SinglePageItem(
                            icon: './assets/icons/tablet-landscape-outline.png',
                            navigation: ScreensHome(),
                            title: Translator.translate("text_screens"),
                          ),
                        ],
                      )
                    ],
                  ),
                )));
      },
    );
  }
}

class SinglePageItem extends StatelessWidget {
  final String title;
  final String icon;
  final Widget navigation;

  const SinglePageItem({
    Key key,
    @required this.title,
    @required this.navigation,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    String assetName;
    if (icon == null) {
      assetName = 'assets/icons/rocket-outline.png';
    } else {
      assetName = icon;
    }
    Widget iconWidget = Image.asset(
      assetName,
      color: themeData.colorScheme.primary,
      width: MySize.size36,
      height: MySize.size36,
    );

    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigation));
      },
      child: Container(
        decoration: new BoxDecoration(
          color: themeData.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(width: 1, color: themeData.colorScheme.surface),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              iconWidget,
              Container(
                margin: EdgeInsets.only(top: MySize.size16),
                child: Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      fontWeight: 500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
