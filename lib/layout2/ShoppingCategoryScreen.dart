import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingCategoryScreen extends StatefulWidget {
  @override
  _ShoppingCategoryScreenState createState() => _ShoppingCategoryScreenState();
}

class _ShoppingCategoryScreenState extends State<ShoppingCategoryScreen> {
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
                body: Container(
              color: customAppTheme.bgLayer2,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Center(
                        child: Text(
                          Translator.translate("text_Select_Category"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.headline5,
                              fontWeight: 700,
                              letterSpacing: 0,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size24,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: singleCategory(
                          image: './assets/image/technology.jpg',
                          title: Translator.translate("text_technology"),
                          description:
                              '241 ' + Translator.translate("text_item")),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size16,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: singleCategory(
                          image: './assets/image/lifestyle.jpg',
                          title: Translator.translate("text_life_style"),
                          description:
                              '325 ' + Translator.translate("text_item")),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size16,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: singleCategory(
                          image: './assets/image/fashion.jpg',
                          title: Translator.translate("text_fashion"),
                          description:
                              '784 ' + Translator.translate("text_item")),
                    ),
                    Container(
                      margin: EdgeInsets.all(MySize.size16),
                      child: singleCategory(
                          image: './assets/image/art.jpg',
                          title: Translator.translate("text_art"),
                          description:
                              '124 ' + Translator.translate("text_item")),
                    ),
                  ],
                ),
              ),
            )));
      },
    );
  }

  Widget singleCategory({String image, String title, String description}) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
          child: Stack(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage(image),
                  height: MySize.getScaledSizeHeight(160),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withAlpha(150),
                  padding: EdgeInsets.only(
                      left: MySize.size16,
                      right: MySize.size16,
                      top: MySize.size8,
                      bottom: MySize.size8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          child: Text(
                        description.toString(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            color: Colors.white,
                            fontWeight: 600,
                            letterSpacing: 0.2),
                      )),
                      Text(
                        title.toString(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle1,
                            color: Colors.white,
                            fontWeight: 600,
                            letterSpacing: 0.2),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
