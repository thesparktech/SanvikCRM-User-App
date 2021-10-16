import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout1/ShoppingCartScreen.dart';
import 'package:SanvikSystem/layout1/ShoppingHomeScreen.dart';
import 'package:SanvikSystem/layout1/ShoppingProfileScreen.dart';
import 'package:SanvikSystem/layout1/ShoppingSearchScreen.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:SanvikSystem/utils/custom/CustomBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingFullApp1 extends StatefulWidget {
  @override
  _ShoppingFullApp1State createState() => _ShoppingFullApp1State();
}

class _ShoppingFullApp1State extends State<ShoppingFullApp1> {
  int _currentIndex = 0;
  ThemeData themeData;
  PageController _pageController;

  NavigationBarTheme navigationBarTheme;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        navigationBarTheme =
            AppTheme.getNavigationThemeFromMode(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
              body: SizedBox.expand(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                    ShoppingHomeScreen(
                      rootContext: context,
                    ),
                    ShoppingSearchScreen(
                      rootContext: context,
                    ),
                    ShoppingCartScreen(),
                    ShoppingProfileScreen(
                      rootContext: context,
                    )
                  ],
                ),
              ),
              bottomNavigationBar: CustomBottomNavigation(
                animationDuration: Duration(milliseconds: 350),
                selectedItemOverlayColor:
                    navigationBarTheme.selectedOverlayColor,
                backgroundColor: navigationBarTheme.backgroundColor,
                selectedIndex: _currentIndex,
                onItemSelected: (index) {
                  setState(() => _currentIndex = index);
                  _pageController.jumpToPage(index);
                },
                items: <CustomBottomNavigationBarItem>[
                  CustomBottomNavigationBarItem(
                      title: Translator.translate("text_home"),
                      icon: Icon(MdiIcons.storeOutline, size: MySize.size22),
                      activeIcon: Icon(MdiIcons.store, size: MySize.size22),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: Translator.translate("text_search"),
                      icon: Icon(MdiIcons.magnify, size: MySize.size22),
                      activeIcon: Icon(MdiIcons.magnify, size: MySize.size22),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: Translator.translate("text_cart"),
                      icon: Icon(MdiIcons.cartOutline, size: MySize.size22),
                      activeIcon: Icon(MdiIcons.cart, size: MySize.size22),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                  CustomBottomNavigationBarItem(
                      title: Translator.translate("text_profile"),
                      icon: Icon(
                        MdiIcons.accountOutline,
                        size: MySize.size22,
                      ),
                      activeIcon: Icon(
                        MdiIcons.account,
                        size: MySize.size22,
                      ),
                      activeColor: navigationBarTheme.selectedItemColor,
                      inactiveColor: navigationBarTheme.unselectedItemColor),
                ],
              ),
            ));
      },
    );
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
