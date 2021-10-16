import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:SanvikSystem/utils/custom/drawer/menu_page.dart';
import 'package:SanvikSystem/utils/custom/drawer/zoom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import 'ShoppingCartScreen.dart';
import 'HomeScreen.dart';
import 'ShoppingOrderStatusScreen.dart';
import 'ProfileScreen.dart';
import 'ShoppingSaleScreen.dart';
import 'ShoppingSearchScreen.dart';

class AppLayout extends StatefulWidget {
  @override
  _AppLayoutPageState createState() => _AppLayoutPageState();
}

class _AppLayoutPageState extends State<AppLayout>
    with SingleTickerProviderStateMixin {
  MenuController menuController;

  int _selectedPage = 0;
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return ChangeNotifierProvider.value(
      value: menuController,
      child: Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget child) {
          themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
          customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
          return ZoomScaffold(
            title: getTitle(_selectedPage),
            menuScreen: MenuScreen(
              menu: Container(
                width: MediaQuery.of(context).size.width,
                color: themeData.colorScheme.background,
                child: Container(
                  width: MySize.getScaledSizeWidth(180),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(
                        flex: 3,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: MySize.size64),
                        width: MySize.getScaledSizeWidth(180),
                        child: InkWell(
                          onTap: () {
                            _selectedPage = 5;
                            Provider.of<MenuController>(context, listen: false)
                                .toggle();
                          },
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          bottom: MySize.size16),
                                      width: MySize.size64,
                                      height: MySize.size64,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "./assets/profile/avatar-2.jpg"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: MySize.size10,
                                      right: MySize.size2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: themeData
                                                  .scaffoldBackgroundColor,
                                              width: MySize.size2,
                                              style: BorderStyle.solid),
                                          color: themeData.colorScheme.primary,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(MySize.size2),
                                          child: Icon(
                                            MdiIcons.pencil,
                                            size: MySize.size14,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  "Deniyo",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600,
                                      letterSpacing: 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            singleDrawerItem(
                                context: context,
                                position: 0,
                                icon: MdiIcons.homeOutline,
                                activeIcon: MdiIcons.home,
                                title: Translator.translate("text_home")),
                            singleDrawerItem(
                                context: context,
                                position: 1,
                                icon: MdiIcons.magnify,
                                activeIcon: MdiIcons.magnify,
                                title: Translator.translate("text_search")),
                            singleDrawerItem(
                                context: context,
                                position: 2,
                                icon: MdiIcons.cartOutline,
                                activeIcon: MdiIcons.cart,
                                title: Translator.translate("text_cart")),
                            singleDrawerItem(
                                context: context,
                                position: 3,
                                icon: MdiIcons.tagOutline,
                                activeIcon: MdiIcons.tag,
                                title: Translator.translate("text_sale")),
                            singleDrawerItem(
                                context: context,
                                position: 4,
                                icon: MdiIcons.contentPaste,
                                activeIcon: MdiIcons.contentPaste,
                                title: Translator.translate("text_orders")),
                          ],
                        ),
                      ),
                      Spacer(flex: 4),
                      Container(
                        width: MySize.getScaledSizeWidth(180),
                        margin: EdgeInsets.only(bottom: MySize.size32),
                        child: Center(
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(MySize.size4)),
                              color: themeData.colorScheme.primary,
                              highlightColor: themeData.colorScheme.primary,
                              splashColor: Colors.white.withAlpha(100),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                  Translator.translate("text_logout")
                                      .toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      fontSize: 12,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.onPrimary,
                                      letterSpacing: 0.8))),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            contentScreen: getContent(_selectedPage, context),
          );
        },
      ),
    );
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return Translator.translate("text_home");
      case 1:
        return Translator.translate("text_search");
      case 2:
        return Translator.translate("text_cart");
      case 3:
        return Translator.translate("text_sale");
      case 4:
        return Translator.translate("text_orders");
      case 5:
        return Translator.translate("text_profile");
      default:
        return "";
    }
  }

  Widget getContent(int index, BuildContext context) {
    switch (index) {
      case 0:
        return HomeScreen(rootContext: context);
      case 1:
        return ShoppingSearchScreen(rootContext: context);
      case 2:
        return ShoppingCartScreen();
      case 3:
        return ShoppingSaleScreen(
          rootContext: context,
        );
      case 4:
        return ShoppingOrderStatusScreen();
      case 5:
        return ProfileScreen();
      default:
        return HomeScreen(rootContext: context);
    }
  }

  Widget singleDrawerItem(
      {IconData icon = MdiIcons.homeOutline,
      String title = "Title",
      int position = 0,
      IconData activeIcon = MdiIcons.home,
      BuildContext context}) {
    bool isSelected = position == _selectedPage;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPage = position;
          Provider.of<MenuController>(context, listen: false).toggle();
        });
      },
      child: Container(
        width: MySize.getScaledSizeWidth(180),
        padding: EdgeInsets.only(
            left: MySize.size16,
            right: MySize.size16,
            top: MySize.size4,
            bottom: MySize.size4),
        child: Container(
          padding: EdgeInsets.only(
              left: MySize.size16, top: MySize.size8, bottom: MySize.size8),
          decoration: isSelected
              ? BoxDecoration(
                  color: themeData.colorScheme.primary.withAlpha(32),
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size8)))
              : BoxDecoration(),
          child: Row(
            children: <Widget>[
              Icon(
                isSelected ? activeIcon : icon,
                size: MySize.size22,
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
}
