import 'package:SanvikSystem/AppTheme.dart';
import 'package:SanvikSystem/AppThemeNotifier.dart';
import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/screens/AboutAppScreen.dart';
import 'package:SanvikSystem/screens/AddCardScreen.dart';
import 'package:SanvikSystem/screens/ChatScreen.dart';
import 'package:SanvikSystem/screens/EmptyCartScreen.dart';
import 'package:SanvikSystem/screens/FAQQuestionScreen.dart';
import 'package:SanvikSystem/screens/MaintenanceScreen.dart';
import 'package:SanvikSystem/screens/MegaMenuScreen.dart';
import 'package:SanvikSystem/screens/NoInternetScreen.dart';
import 'package:SanvikSystem/screens/PageNotFoundScreen.dart';
import 'package:SanvikSystem/screens/ProductSearchScreen.dart';
import 'package:SanvikSystem/screens/ProductSoldOutScreen.dart';
import 'package:SanvikSystem/screens/SelectSizeSheet.dart';
import 'package:SanvikSystem/screens/ShoppingCartScreen.dart';
import 'package:SanvikSystem/screens/ShoppingDrawer.dart';
import 'package:SanvikSystem/screens/SingleCategoryScreen.dart';
import 'package:SanvikSystem/screens/TermsScreen.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class ScreensHome extends StatefulWidget {
  @override
  _ScreensHomeState createState() => _ScreensHomeState();
}

class _ScreensHomeState extends State<ScreensHome> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
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
                  title: Text("Screens",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
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
                            iconData: MdiIcons.dialpad,
                            navigation: SelectSizeSheet(),
                            title: Translator.translate("text_select_size"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: ShoppingDrawer(),
                            title: Translator.translate("text_drawer"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: ShoppingCartScreen(),
                            title: Translator.translate("text_cart"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: MaintenanceScreen(),
                            title: Translator.translate("text_maintenance"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: EmptyCartScreen(),
                            title: Translator.translate("text_empty_cart"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: AddCardScreen(),
                            title: Translator.translate("text_add_card"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: PageNotFoundScreen(),
                            title: Translator.translate("text_page_not_found"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: ProductsSearchScreen(),
                            title: Translator.translate("text_product_search"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: NoInternetScreen(),
                            title: Translator.translate("text_no_internet"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: ChatScreen(),
                            title: Translator.translate("text_chat"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: ProductSoldOutScreen(),
                            title: Translator.translate("text_sold_out"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: TermsScreen(),
                            title: Translator.translate("text_terms"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: MegaMenuScreen(),
                            title: Translator.translate("text_mega_menu"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: SingleCategoryScreen(),
                            title: Translator.translate("text_single_category"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: FAQQuestionScreen(),
                            title: Translator.translate("text_FAQ"),
                            buildContext: context,
                          ),
                          SinglePageItem(
                            iconData: MdiIcons.dialpad,
                            navigation: AboutAppScreen(),
                            title: Translator.translate("text_about_app"),
                            buildContext: context,
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
  final IconData iconData;
  final Widget navigation;
  final BuildContext buildContext;

  const SinglePageItem({
    Key key,
    @required this.title,
    @required this.navigation,
    @required this.iconData,
    this.buildContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    Widget iconWidget = Image.asset(
      'assets/icons/tablet-landscape-outline.png',
      color: themeData.colorScheme.primary,
      width: MySize.size36,
      height: MySize.size36,
    );

    return InkWell(
      onTap: () {
        Navigator.push(buildContext == null ? context : buildContext,
            MaterialPageRoute(builder: (context) => navigation));
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
