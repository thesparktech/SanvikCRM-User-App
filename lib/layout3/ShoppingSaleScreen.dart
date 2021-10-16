import 'dart:async';
import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import 'ShoppingProductScreen.dart';

class ShoppingSaleScreen extends StatefulWidget {
  final BuildContext rootContext;

  const ShoppingSaleScreen({Key key, @required this.rootContext})
      : super(key: key);

  @override
  _ShoppingSaleScreenState createState() => _ShoppingSaleScreenState();
}

class _ShoppingSaleScreenState extends State<ShoppingSaleScreen> {
  String hourTxt = "02", minuteTxt = "46", secondTxt = "40";
  Timer _timer;
  int _nowTime = 10000;

  ThemeData themeData;

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24) /
        ((width / 2 - MySize.size24) + MySize.getScaledSizeHeight(50));
  }

  convertTime() {
    int hour = (_nowTime / 3600).floor();
    int minute = ((_nowTime - 3600 * hour) / 60).floor();
    int second = (_nowTime - 3600 * hour - 60 * minute);
    if (hour < 10) {
      setState(() {
        hourTxt = "0" + hour.toString();
      });
    } else {
      setState(() {
        hourTxt = hour.toString();
      });
    }
    if (minute < 10) {
      setState(() {
        minuteTxt = "0" + minute.toString();
      });
    } else {
      setState(() {
        minuteTxt = minute.toString();
      });
    }
    if (second < 10) {
      setState(() {
        secondTxt = "0" + second.toString();
      });
    } else {
      setState(() {
        secondTxt = second.toString();
      });
    }
  }

  initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_nowTime < 1) {
            timer.cancel();
          } else {
            _nowTime = _nowTime - 1;
            convertTime();
          }
        },
      ),
    );
  }

  dispose() {
    super.dispose();
    _timer.cancel();
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                backgroundColor: themeData.backgroundColor,
                body: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: MySize.size16, right: MySize.size16),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: themeData.backgroundColor,
                            border: Border.all(
                                color: themeData.colorScheme.primary),
                            borderRadius: BorderRadius.circular(MySize.size8)),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                right: MySize.size32,
                                top: MySize.size60,
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                          Translator.translate(
                                                  "text_hurry_up") +
                                              "!",
                                          style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            fontWeight: 600,
                                          )),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size4),
                                        child: Text(
                                            hourTxt +
                                                " : " +
                                                minuteTxt +
                                                " : " +
                                                secondTxt,
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.headline6,
                                                fontWeight: 600)),
                                      )
                                    ],
                                  ),
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MySize.getScaledSizeHeight(180),
                              child: ClipPath(
                                  clipper: _MyCustomClipper(),
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: themeData.colorScheme.primaryVariant,
                                  )),
                            ),
                            Positioned(
                              left: MySize.size30,
                              top: MySize.size52,
                              child: Container(
                                child: Text(
                                    Translator.translate("text_happy")
                                            .toUpperCase() +
                                        "\n" +
                                        Translator.translate("text_new_year")
                                            .toUpperCase() +
                                        "\n" +
                                        Translator.translate("text_sale")
                                            .toUpperCase(),
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.headline6,
                                      fontWeight: 700,
                                      letterSpacing: 0.3,
                                      color: themeData.colorScheme.onPrimary,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size16,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: Text("50% " + Translator.translate("text_off"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 700)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: MySize.size8),
                      child: GridView.count(
                        padding: EdgeInsets.all(MySize.size16),
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio:
                            findAspectRatio(MediaQuery.of(context).size.width),
                        mainAxisSpacing: MySize.size16,
                        crossAxisSpacing: MySize.size16,
                        children: <Widget>[
                          _OfferWidget(
                            name: 'Cup cake',
                            image: './assets/product/product-1.jpg',
                            price: 89,
                            buildContext: widget.rootContext,
                          ),
                          _OfferWidget(
                            name: 'Gems',
                            image: './assets/product/product-2.jpg',
                            price: 111,
                            buildContext: widget.rootContext,
                          ),
                          _OfferWidget(
                            name: 'Sandals',
                            buildContext: widget.rootContext,
                            image: './assets/product/product-8.jpg',
                            price: 77,
                          ),
                          _OfferWidget(
                            name: 'Cosmic',
                            buildContext: widget.rootContext,
                            image: './assets/product/product-7.jpg',
                            price: 119,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size8,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: Text("20% " + Translator.translate("text_off"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 700)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0, bottom: MySize.size8),
                      child: GridView.count(
                        padding: EdgeInsets.all(MySize.size16),
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio:
                            findAspectRatio(MediaQuery.of(context).size.width),
                        mainAxisSpacing: MySize.size16,
                        crossAxisSpacing: MySize.size16,
                        children: <Widget>[
                          _OfferWidget(
                            name: 'Cup cake',
                            image: './assets/product/product-1.jpg',
                            price: 89,
                            buildContext: widget.rootContext,
                          ),
                          _OfferWidget(
                            name: 'Gems',
                            image: './assets/product/product-2.jpg',
                            price: 111,
                            buildContext: widget.rootContext,
                          ),
                          _OfferWidget(
                            name: 'Sandals',
                            buildContext: widget.rootContext,
                            image: './assets/product/product-8.jpg',
                            price: 77,
                          ),
                          _OfferWidget(
                            name: 'Cosmic',
                            buildContext: widget.rootContext,
                            image: './assets/product/product-7.jpg',
                            price: 119,
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.65, 0.0);
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(size.width * 0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class _OfferWidget extends StatelessWidget {
  final String image, name;
  final int price;
  final BuildContext buildContext;

  const _OfferWidget({
    Key key,
    @required this.image,
    @required this.name,
    @required this.price,
    @required this.buildContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String heroTag = Generator.randomString(10);
    ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            buildContext,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: heroTag,
                      image: image,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.cardTheme.color,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
          boxShadow: [
            BoxShadow(
              color: themeData.cardTheme.shadowColor.withAlpha(16),
              blurRadius: MySize.size8,
              spreadRadius: MySize.size4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: heroTag,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        image,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ],
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: MySize.size8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 600,
                          letterSpacing: 0)),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size2),
                    child: Text(
                      "\$ " + price.toString(),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          fontWeight: 700,
                          letterSpacing: 0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
