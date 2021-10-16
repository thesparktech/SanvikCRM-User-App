import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout1/ShoppingCheckoutScreen.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag, image;

  const ShoppingProductScreen(
      {Key key,
      this.heroTag = "heroTag",
      this.image = './assets/product/product-5.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;
  CustomAppTheme customAppTheme;
  bool _isFavourite = false;
  String descText = Generator.getDummyText(6);

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder:
          (BuildContext buildContext, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: customAppTheme.bgLayer2,
                    elevation: 0,
                    leading: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        MdiIcons.chevronLeft,
                        color: themeData.colorScheme.onBackground,
                      ),
                    ),
                    title: Text("Febreze AIR",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 600)),
                  ),
                  backgroundColor: customAppTheme.bgLayer2,
                  body: Column(
                    children: <Widget>[
                      Expanded(
                          child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8)),
                                child: Image.asset(
                                  widget.image,
                                  width: MySize.safeHeight * 0.3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: Text(
                                "Febreze AIR",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600,
                                    letterSpacing: 0.2),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size8),
                              child: Text(
                                descText,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 400,
                                    letterSpacing: 0),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      child: Generator.buildProgress(
                                          width: MySize.size100,
                                          height: MySize.size5,
                                          activeColor:
                                              themeData.colorScheme.primary,
                                          inactiveColor: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(100),
                                          progress: 0.6)),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: MySize.size16),
                                    child: Text(
                                      "123 " +
                                          Translator.translate("text_items"),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 500,
                                          height: 1),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: themeData.cardTheme.shadowColor
                                      .withAlpha(6),
                                  blurRadius: 4,
                                  offset: Offset(0, -4))
                            ],
                            color: themeData.backgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(MySize.size24),
                                topRight: Radius.circular(MySize.size24))),
                        padding: EdgeInsets.symmetric(
                            vertical: MySize.size32, horizontal: MySize.size24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        Translator.translate("text_size")
                                            .toUpperCase(),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(180),
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "34",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.headline6,
                                                  fontWeight: 600),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: MySize.size4),
                                              child: Icon(
                                                MdiIcons.chevronDown,
                                                size: 20,
                                                color: themeData
                                                    .colorScheme.onBackground
                                                    .withAlpha(200),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        Translator.translate("text_color")
                                            .toUpperCase(),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(180),
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              width: MySize.size20,
                                              height: MySize.size20,
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  shape: BoxShape.circle),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: MySize.size4),
                                              child: Icon(
                                                MdiIcons.chevronDown,
                                                size: MySize.size20,
                                                color: themeData
                                                    .colorScheme.onBackground
                                                    .withAlpha(200),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        Translator.translate("text_QTY"),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(180),
                                            fontWeight: 600),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              "2",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.headline6,
                                                  fontWeight: 600),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: MySize.size4),
                                              child: Icon(
                                                MdiIcons.chevronDown,
                                                size: MySize.size20,
                                                color: themeData
                                                    .colorScheme.onBackground
                                                    .withAlpha(200),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              MySize.size36)),
                                      color: themeData.colorScheme.primary,
                                      splashColor: themeData.splashColor,
                                      highlightColor:
                                          themeData.colorScheme.primary,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShoppingCheckoutScreen()));
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                "\$39.99",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle1,
                                                    letterSpacing: 0.4,
                                                    fontWeight: 700,
                                                    color: themeData
                                                        .colorScheme.onPrimary),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Container(
                                              padding:
                                                  EdgeInsets.all(MySize.size8),
                                              decoration: BoxDecoration(
                                                  color: themeData
                                                      .colorScheme.primary
                                                      .withAlpha(230),
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                MdiIcons.cartArrowDown,
                                                size: MySize.size20,
                                                color: themeData
                                                    .colorScheme.onPrimary,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.only(
                                          top: MySize.size12,
                                          bottom: MySize.size12,
                                          right: MySize.size16),
                                    ),
                                  )),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isFavourite = !_isFavourite;
                                      });
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: MySize.size16),
                                      padding: EdgeInsets.all(MySize.size16),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: themeData.backgroundColor,
                                          boxShadow: [
                                            BoxShadow(
                                                color: themeData
                                                    .cardTheme.shadowColor
                                                    .withAlpha(24),
                                                blurRadius: MySize.size10,
                                                offset: Offset(0, MySize.size5))
                                          ]),
                                      child: Icon(
                                        _isFavourite
                                            ? MdiIcons.heart
                                            : MdiIcons.heartOutline,
                                        color: themeData.colorScheme.primary,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ));
      },
    );
  }
}
