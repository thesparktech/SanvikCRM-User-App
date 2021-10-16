import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingDrawer extends StatefulWidget {
  @override
  _ShoppingDrawerState createState() => _ShoppingDrawerState();
}

class _ShoppingDrawerState extends State<ShoppingDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedPage = 1;
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  title: Text(Translator.translate("text_drawer"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                drawer: SafeArea(
                  child: Container(
                    color: themeData.backgroundColor,
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
                              color: themeData.backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.cardTheme.shadowColor
                                      .withAlpha(16),
                                  blurRadius: MySize.size28,
                                )
                              ]),
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
                              top: MySize.size8, left: MySize.size32),
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
                                  position: 1,
                                  icon: MdiIcons.homeOutline,
                                  activeIcon: MdiIcons.home,
                                  title: Translator.translate("text_home")),
                              singleDrawerItem(
                                  position: 2,
                                  icon: MdiIcons.cartOutline,
                                  activeIcon: MdiIcons.cart,
                                  title: Translator.translate("text_cart")),
                              singleDrawerItem(
                                  position: 3,
                                  icon: MdiIcons.heartOutline,
                                  activeIcon: MdiIcons.heart,
                                  title:
                                      Translator.translate("text_favourite")),
                              singleDrawerItem(
                                  position: 4,
                                  icon: MdiIcons.bookOutline,
                                  activeIcon: MdiIcons.book,
                                  title: Translator.translate("text_order")),
                              Container(
                                  margin: EdgeInsets.only(
                                      left: MySize.size24,
                                      right: MySize.size24,
                                      top: MySize.size16,
                                      bottom: MySize.size16),
                                  child: Divider()),
                              Container(
                                padding: EdgeInsets.only(
                                    left: MySize.size32,
                                    top: MySize.size12,
                                    bottom: MySize.size12),
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.logoutVariant,
                                      size: MySize.size24,
                                      color: themeData.colorScheme.onBackground,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: MySize.size16),
                                      child: Text(
                                        Translator.translate("text_logout"),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 500),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    MdiIcons.chevronLeft,
                    color: themeData.colorScheme.onPrimary,
                  ),
                ),
                body: Container(
                  color: themeData.backgroundColor,
                )));
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
            top: MySize.size8,
            bottom: MySize.size8),
        child: Row(
          children: <Widget>[
            Container(
              height: MySize.getScaledSizeHeight(5),
              width: MySize.getScaledSizeHeight(5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? themeData.colorScheme.primary
                      : Colors.transparent),
            ),
            Container(
              margin: EdgeInsets.only(left: MySize.size12),
              child: Icon(isSelected ? activeIcon : icon,
                  size: MySize.size24,
                  color: isSelected
                      ? themeData.colorScheme.onBackground
                      : themeData.colorScheme.onBackground.withAlpha(220)),
            ),
            Container(
              margin: EdgeInsets.only(left: MySize.size16),
              child: Text(
                title,
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                    color: isSelected
                        ? themeData.colorScheme.onBackground
                        : themeData.colorScheme.onBackground.withAlpha(220),
                    fontWeight: isSelected ? 700 : 600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
