import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout1/ShoppingProductScreen.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingHomeScreen extends StatefulWidget {
  final BuildContext rootContext;

  const ShoppingHomeScreen({Key key, @required this.rootContext})
      : super(key: key);

  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen>
    with SingleTickerProviderStateMixin {
  CustomAppTheme customAppTheme;
  ThemeData themeData;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  backgroundColor: themeData.backgroundColor,
                  body: ListView(
                    padding: EdgeInsets.all(0),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              Translator.translate("text_welcome"),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  color: themeData.colorScheme.onBackground,
                                  letterSpacing: 0,
                                  fontWeight: 600),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(new MaterialPageRoute<Null>(
                                        builder: (BuildContext context) {
                                          return NotificationDialog();
                                        },
                                        fullscreenDialog: true));
                              },
                              child: Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  Icon(
                                    MdiIcons.bellOutline,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(200),
                                  ),
                                  Positioned(
                                    right: -2,
                                    top: -2,
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      height: MySize.size14,
                                      width: MySize.size14,
                                      decoration: BoxDecoration(
                                          color: themeData.colorScheme.primary,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size40))),
                                      child: Center(
                                        child: Text(
                                          "2",
                                          style: AppTheme.getTextStyle(
                                            themeData.textTheme.overline,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontSize: 9,
                                            fontWeight: 500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(MySize.size16),
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.5, color: themeData.colorScheme.surface),
                          color: themeData.cardTheme.color,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  themeData.cardTheme.shadowColor.withAlpha(12),
                              blurRadius: MySize.size16,
                              offset: Offset(0, MySize.size8),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: MySize.getScaledSizeHeight(120),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(MySize.size8),
                                      decoration: BoxDecoration(
                                          color: customAppTheme.bgLayer3,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size4))),
                                      child: Text(
                                        Translator.translate("text_trending"),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            muted: true,
                                            letterSpacing: 0.3,
                                            fontWeight: 600),
                                      ),
                                    ),
                                    Text(
                                      "Colorful Sandal",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600,
                                          letterSpacing: 0),
                                    ),
                                    Text(
                                      "\$ 49.99",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600,
                                          letterSpacing: 0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size4)),
                                child: Image(
                                  image: AssetImage(
                                      './assets/product/product-8.jpg'),
                                  width: MySize.getScaledSizeHeight(125),
                                  height: MySize.getScaledSizeHeight(125),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(Translator.translate("text_popular_deals"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0)),
                            Text(Translator.translate("text_view_all"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    fontWeight: 500,
                                    color: themeData.colorScheme.primary,
                                    letterSpacing: 0)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/product/product-10.jpg',
                                    name: "Pop corn",
                                    rate: 45.99),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/product/product-7.jpg',
                                    name: "Cosmic bang",
                                    rate: 78.99),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/product/product-5.jpg',
                                    name: "Sweet Gems",
                                    rate: 35.99),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/product/product-2.jpg',
                                    name: "Toffees",
                                    rate: 28.49),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: MySize.size24, right: MySize.size24),
                                child: singleItemWidget(
                                    image: './assets/product/product-3.jpg',
                                    name: "Candies",
                                    rate: 15.99),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(Translator.translate("text_for_you"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 600,
                                    letterSpacing: 0)),
                            Text(Translator.translate("text_view_all"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.primary,
                                    fontWeight: 500,
                                    letterSpacing: 0)),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: _ProductListWidget(
                                name: "Sweet Gems",
                                image: './assets/product/product-5.jpg',
                                shopName: 'El Primo',
                                buildContext: context,
                                star: 4.5,
                                price: 1470,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24),
                              child: _ProductListWidget(
                                name: "Lipsticks",
                                image: './assets/product/product-4.jpg',
                                shopName: 'Bee Lipstore',
                                buildContext: context,
                                star: 3.8,
                                price: 1486,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24),
                              child: _ProductListWidget(
                                name: "Candies",
                                image: './assets/product/product-3.jpg',
                                shopName: 'Bee Lipstore',
                                buildContext: context,
                                star: 4,
                                price: 1456,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size24),
                        child: Text(Translator.translate("text_best_sellers"),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600,
                                letterSpacing: 0)),
                      ),
                      Container(
                        margin: EdgeInsets.all(MySize.size24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            singleSellerWidget(
                                image: './assets/profile/avatar-1.jpg',
                                name: 'Liss\'s Shop'),
                            singleSellerWidget(
                                image: './assets/profile/avatar-2.jpg',
                                name: 'Ekk Shop'),
                            singleSellerWidget(
                                image: './assets/profile/avatar-3.jpg',
                                name: 'Shop Center'),
                            singleSellerWidget(
                                image: './assets/profile/avatar-4.jpg',
                                name: 'Sweety')
                          ],
                        ),
                      ),
                    ],
                  )),
            ));
      },
    );
  }

  Widget singleItemWidget({String image, String name, double rate}) {
    String key = Generator.randomString(10);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: image,
                    )));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size4)),
              child: Image.asset(
                image,
                height: MySize.getScaledSizeHeight(120),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8),
              child: Text(name,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      color: themeData.colorScheme.onBackground,
                      letterSpacing: 0,
                      muted: true,
                      fontWeight: 600)),
            ),
            Text("\$ " + rate.toString(),
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground,
                    letterSpacing: 0,
                    fontWeight: 500)),
          ],
        ),
      ),
    );
  }

  Widget singleSellerWidget({String image, String name}) {
    double size = MySize.safeWidth * 0.15;
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(size / 2)),
            child: Image(
              image: AssetImage(image),
              width: size,
              height: size,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size4),
            child: Text(
              name,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 500,
                  letterSpacing: 0),
            ),
          )
        ],
      ),
    );
  }
}

class NotificationDialog extends StatefulWidget {
  @override
  _NotificationDialogState createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.backgroundColor,
        elevation: 0,
        title: Text(Translator.translate("text_notification"),
            style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                fontWeight: 600)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: MySize.size16),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.notificationClearAll,
                size: MySize.size24,
                color: themeData.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: themeData.backgroundColor,
        padding: EdgeInsets.all(MySize.size16),
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    Translator.translate("text_offers"),
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    width: MySize.size18,
                    height: MySize.size18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size10))),
                    child: Center(
                        child: Text(
                      "2",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontSize: 10,
                          color: themeData.colorScheme.primary,
                          fontWeight: 600),
                    )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/product/product-8.jpg',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "50% " +
                              Translator.translate("text_off").toUpperCase() +
                              " ",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600,
                              letterSpacing: 0.2)),
                      TextSpan(
                          text: Translator.translate(
                                  "text_in_ultraboost_all_puma_ltd_shoes") +
                              " !!!",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2))
                    ]),
                  ),
                  time: "9:35 AM"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/product/product-2.jpg',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "30% " +
                              Translator.translate("text_off").toUpperCase() +
                              " ",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.primary,
                              fontWeight: 600,
                              letterSpacing: 0.2)),
                      TextSpan(
                          text: Translator.translate(
                              "text_in_all_cake_till_31_july"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2))
                    ]),
                  ),
                  time: "9:35 AM"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    Translator.translate("text_orders"),
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    width: MySize.size18,
                    height: MySize.size18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size10))),
                    child: Center(
                        child: Text(
                      "8",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontSize: 10,
                          color: themeData.colorScheme.primary,
                          fontWeight: 600),
                    )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/product/product-1.jpg',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: Translator.translate(
                              "text_your_cake_order_has_been_delivered_at_himalaya"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0))
                    ]),
                  ),
                  time: Translator.translate("text_Just_Now")),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/product/product-3.jpg',
                  text: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: Translator.translate(
                              "text_last_order_has_been_cancelled_by_seller"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500,
                              letterSpacing: 0.2))
                    ]),
                  ),
                  time: "14 July"),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: Center(
                child: Text(
                  Translator.translate("text_view_all"),
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      color: themeData.colorScheme.primary,
                      fontWeight: 600,
                      letterSpacing: 0.2),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    Translator.translate("text_security"),
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MySize.size8),
                    width: MySize.size18,
                    height: MySize.size18,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size10))),
                    child: Center(
                        child: Text(
                      "1",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontSize: 10,
                          color: themeData.colorScheme.primary,
                          fontWeight: 600),
                    )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size24),
              child: singleNotification(
                  image: './assets/profile/avatar-1.jpg',
                  text: RichText(
                    text: TextSpan(
                        text: Translator.translate(
                            "text_your_account_password_has_been_changed"),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 500,
                            letterSpacing: 0.2)),
                  ),
                  time: "2 days ago"),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleNotification({String image, RichText text, String time}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MySize.size44,
            height: MySize.size44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Container(
                margin:
                    EdgeInsets.only(left: MySize.size18, right: MySize.size18),
                child: text),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: AppTheme.getTextStyle(themeData.textTheme.caption,
                    color: themeData.colorScheme.onBackground,
                    fontSize: 12,
                    muted: true,
                    fontWeight: 500,
                    letterSpacing: -0.2),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image, shopName;
  final double star;
  final int price;
  final BuildContext buildContext;

  const _ProductListWidget(
      {Key key,
      @required this.name,
      @required this.image,
      @required this.shopName,
      @required this.star,
      @required this.price,
      @required this.buildContext})
      : super(key: key);

  @override
  __ProductListWidgetState createState() => __ProductListWidgetState();
}

class __ProductListWidgetState extends State<_ProductListWidget> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    String key = Generator.randomString(10);
    return InkWell(
      onTap: () {
        Navigator.push(
            widget.buildContext,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: key,
                      image: widget.image,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.cardTheme.color,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
          boxShadow: [
            BoxShadow(
              color: themeData.cardTheme.shadowColor.withAlpha(16),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(MySize.size16),
        child: Row(
          children: <Widget>[
            Hero(
              tag: key,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
                child: Image.asset(
                  widget.image,
                  height: MySize.getScaledSizeHeight(90),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MySize.getScaledSizeHeight(90),
                margin: EdgeInsets.only(left: MySize.size16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.name,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600,
                                letterSpacing: 0)),
                        Icon(
                          MdiIcons.heart,
                          color:
                              themeData.colorScheme.onBackground.withAlpha(75),
                          size: MySize.size22,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Generator.buildRatingStar(
                            rating: widget.star,
                            size: MySize.size16,
                            inactiveColor: themeData.colorScheme.onBackground),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size4),
                          child: Text(widget.star.toString(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText1,
                                  fontWeight: 600)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.storeOutline,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(200),
                              size: MySize.size20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MySize.size4),
                              child: Text(
                                widget.shopName,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(200),
                                    fontWeight: 500),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "\$ " + widget.price.toString(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 700),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
