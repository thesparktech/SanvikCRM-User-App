import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout2/ShoppingHomeScreen.dart';
import 'package:SanvikSystem/layout2/ShoppingSettingScreen.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:SanvikSystem/layout2/ShoppingCartScreen.dart';
import 'package:SanvikSystem/layout2/ShoppingFavouriteScreen.dart';
import 'package:SanvikSystem/layout2/ShoppingOrderScreen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingFullApp2 extends StatefulWidget {
  @override
  _ShoppingFullApp2State createState() => _ShoppingFullApp2State();
}

class _ShoppingFullApp2State extends State<ShoppingFullApp2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedPage = 0;
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(themeType),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  backgroundColor: customAppTheme.bgLayer2,
                  title: Text(getTitle(_selectedPage),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                drawer: SafeArea(
                  child: Container(
                    color: customAppTheme.bgLayer1,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: MySize.size36, left: MySize.size16),
                          padding: EdgeInsets.all(MySize.size8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size16)),
                            color: customAppTheme.bgLayer2,
                          ),
                          child: Image(
                            image: AssetImage(
                                './assets/profile/avatar-outline-2.png'),
                            height: MySize.size56,
                            color: themeData.colorScheme.primary,
                            width: MySize.size56,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MySize.size16, left: MySize.size32),
                          child: Text(
                            Translator.translate("text_hey"),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 700,
                                letterSpacing: 0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MySize.size4,
                              left: MySize.size32,
                              bottom: MySize.size32),
                          child: Text(
                            "Deni N.",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 700,
                                letterSpacing: 0),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              singleDrawerItem(
                                  position: 0,
                                  icon: MdiIcons.homeOutline,
                                  activeIcon: MdiIcons.home,
                                  title: Translator.translate("text_home")),
                              singleDrawerItem(
                                  position: 1,
                                  icon: MdiIcons.cartOutline,
                                  activeIcon: MdiIcons.cart,
                                  title: Translator.translate("text_cart")),
                              singleDrawerItem(
                                  position: 2,
                                  icon: MdiIcons.heartOutline,
                                  activeIcon: MdiIcons.heart,
                                  title:
                                      Translator.translate("text_favourite")),
                              singleDrawerItem(
                                  position: 3,
                                  icon: MdiIcons.bookOutline,
                                  activeIcon: MdiIcons.book,
                                  title: Translator.translate("text_orders")),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: MySize.size24,
                                      right: MySize.size24,
                                      top: MySize.size16,
                                      bottom: MySize.size16),
                                  child: Divider()),
                              singleDrawerItem(
                                  position: 4,
                                  icon: MdiIcons.cogOutline,
                                  activeIcon: MdiIcons.cog,
                                  title: Translator.translate("text_setting")),
                              InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState.openEndDrawer();
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: MySize.size32,
                                      top: MySize.size12,
                                      bottom: MySize.size12),
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.logoutVariant,
                                        size: MySize.size24,
                                        color:
                                            themeData.colorScheme.onBackground,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MySize.size16),
                                        child: Text(
                                          Translator.translate("text_logout"),
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                              fontWeight: 500),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                body: getPage(_selectedPage)));
      },
    );
  }

  Widget singleDrawerItem(
      {IconData icon = MdiIcons.homeOutline,
      String title = "Title",
      int position = 0,
      IconData activeIcon = MdiIcons.home}) {
    bool isSelected = position == _selectedPage;

    return InkWell(
      onTap: () {
        setState(() {
          _scaffoldKey.currentState.openEndDrawer();
          _selectedPage = position;
        });
      },
      child: Container(
        padding: EdgeInsets.only(
            left: MySize.size16,
            right: MySize.size16,
            top: MySize.size4,
            bottom: MySize.size4),
        child: Container(
          padding: EdgeInsets.only(
              left: MySize.size16, top: MySize.size8, bottom: MySize.size8),
          child: Row(
            children: <Widget>[
              Icon(
                isSelected ? activeIcon : icon,
                size: MySize.size24,
                color: isSelected
                    ? themeData.colorScheme.primary
                    : themeData.colorScheme.onBackground,
              ),
              Container(
                margin: EdgeInsets.only(left: MySize.size16),
                child: Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                      color: isSelected
                          ? themeData.colorScheme.primary
                          : themeData.colorScheme.onBackground,
                      fontWeight: isSelected ? 600 : 500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return Translator.translate("text_home");
      case 1:
        return Translator.translate("text_cart");
      case 2:
        return Translator.translate("text_favourite");
      case 3:
        return Translator.translate("text_order");
      case 4:
        return Translator.translate("text_setting");
    }
    return Translator.translate("text_home");
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return ShoppingHomeScreen(
          rootContext: context,
        );
      case 1:
        return ShoppingCartScreen();
      case 2:
        return ShoppingFavouriteScreen();
      case 3:
        return ShoppingOrderScreen();
      case 4:
        return ShoppingSettingScreen();
    }
    return ShoppingHomeScreen(rootContext: context);
  }
}
