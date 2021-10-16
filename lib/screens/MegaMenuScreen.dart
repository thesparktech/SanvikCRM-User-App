import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class MegaMenuScreen extends StatefulWidget {
  @override
  _MegaMenuScreenState createState() => _MegaMenuScreenState();
}

class _MegaMenuScreenState extends State<MegaMenuScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24) / ((width / 2 - MySize.size24) - 22);
  }

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
                  title: Text(Translator.translate("text_Mega_Menu"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: Container(
                  child: GridView.count(
                    padding: EdgeInsets.only(
                        left: MySize.size16,
                        right: MySize.size16,
                        bottom: MySize.size16),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio:
                        findAspectRatio(MediaQuery.of(context).size.width),
                    mainAxisSpacing: MySize.size16,
                    crossAxisSpacing: MySize.size16,
                    children: <Widget>[
                      singleItem(
                          image: './assets/vector/tshirt.png',
                          title: "Top wear",
                          listItem: [
                            Translator.translate("text_formal_shirts"),
                            Translator.translate("text_casual_t_shirts"),
                            Translator.translate("text_suits_and_blazers")
                          ]),
                      singleItem(
                          image: './assets/vector/dress.png',
                          title: Translator.translate("text_dress"),
                          listItem: [
                            Translator.translate("text_balloon") +
                                " " +
                                Translator.translate("text_dress"),
                            Translator.translate("text_cocktail") +
                                " " +
                                Translator.translate("text_dress"),
                            Translator.translate("text_denim") +
                                " " +
                                Translator.translate("text_dress")
                          ]),
                      singleItem(
                          image: './assets/vector/shoes.png',
                          title: Translator.translate("text_shoes"),
                          listItem: [
                            Translator.translate("text_sports") +
                                " " +
                                Translator.translate("text_shoes"),
                            Translator.translate("text_casual") +
                                " " +
                                Translator.translate("text_shoes"),
                            Translator.translate("text_formal") +
                                " " +
                                Translator.translate("text_shoes")
                          ]),
                      singleItem(
                          image: './assets/vector/laptop.png',
                          title: Translator.translate("text_laptop"),
                          listItem: [
                            Translator.translate("text_ultrabook"),
                            Translator.translate("text_chromebook"),
                            Translator.translate("text_macbook")
                          ]),
                      singleItem(
                          image: './assets/vector/headphone.png',
                          title: Translator.translate("text_headphone"),
                          listItem: [
                            Translator.translate("text_on_ear"),
                            Translator.translate("text_over_ear"),
                            Translator.translate("text_earbuds")
                          ]),
                      singleItem(
                          image: './assets/vector/mobile.png',
                          title: Translator.translate("text_mobile"),
                          listItem: [
                            "Xiaomi",
                            "Samsung",
                            "Apple",
                          ]),
                      singleItem(
                          image: './assets/vector/watch.png',
                          title: Translator.translate("text_watches"),
                          listItem: ["Titan", "Fast Track", "Fossil"]),
                    ],
                  ),
                )));
      },
    );
  }

  Widget buildListItem(List<String> listItem) {
    List<Widget> list = [];

    for (int i = 0; i < listItem.length; i++) {
      list.add(Container(
        margin: EdgeInsets.only(bottom: MySize.size2),
        child: Text(
          listItem[i],
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
              color: themeData.colorScheme.onBackground,
              fontWeight: 500,
              letterSpacing: 0.2),
        ),
      ));
    }

    list.add(Container(
      margin: EdgeInsets.only(bottom: MySize.size2),
      child: Text(
        Translator.translate("text_more") + "...",
        style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
            color: themeData.colorScheme.primary,
            fontWeight: 500,
            letterSpacing: 0.2),
      ),
    ));

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }

  Widget singleItem({String image, String title, List<String> listItem}) {
    return Container(
      padding: EdgeInsets.all(MySize.size16),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          boxShadow: [
            BoxShadow(
              color: themeData.cardTheme.shadowColor.withAlpha(16),
              blurRadius: MySize.size6,
              offset: Offset(0, MySize.size2),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(MySize.size4))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage(image),
                height: MySize.size24,
                width: MySize.size24,
                color: themeData.colorScheme.primary,
              ),
              Container(
                margin: EdgeInsets.only(left: MySize.size8),
                child: Text(
                  title,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.primary,
                      fontWeight: 600,
                      letterSpacing: 0.2),
                ),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: MySize.size32, top: MySize.size8),
              child: buildListItem(listItem))
        ],
      ),
    );
  }
}
