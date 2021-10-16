import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout1/ShoppingCouponScreen.dart';
import 'package:SanvikSystem/layout1/ShoppingOrderPlaceScreen.dart';
import 'package:SanvikSystem/layout2/ShoppingAddressScreen.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingCheckoutScreen extends StatefulWidget {
  @override
  _ShoppingCheckoutScreenState createState() => _ShoppingCheckoutScreenState();
}

class _ShoppingCheckoutScreenState extends State<ShoppingCheckoutScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  int methodType = 0;

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
                backgroundColor: customAppTheme.bgLayer3,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: customAppTheme.bgLayer3,
                  leading: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  centerTitle: true,
                  title: Text(Translator.translate("text_checkout"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 600)),
                ),
                body: ListView(
                  padding: EdgeInsets.only(
                      left: MySize.size16,
                      right: MySize.size16,
                      bottom: MySize.size16),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingAddressScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(MySize.size20),
                        decoration: BoxDecoration(
                            color: customAppTheme.bgLayer1,
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size4)),
                            boxShadow: [
                              BoxShadow(
                                  color: themeData.cardTheme.shadowColor
                                      .withAlpha(10),
                                  blurRadius: 8)
                            ]),
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size4)),
                              child: Image.asset(
                                './assets/other/map-snap.png',
                                height: MySize.size64,
                                width: MySize.getScaledSizeWidth(86),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: MySize.size64,
                                margin: EdgeInsets.only(left: MySize.size16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "West Drive",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                    Text(
                                      "14, 921 Section",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData
                                              .colorScheme.onBackground
                                              .withAlpha(150),
                                          fontWeight: 500),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: MySize.size4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Icon(
                                            MdiIcons.informationOutline,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(200),
                                            size: MySize.size10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: MySize.size4),
                                            child: Text(
                                              "Tap to change",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontSize: 9,
                                                  fontWeight: 400,
                                                  color: themeData.colorScheme
                                                      .onBackground),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Text(
                        Translator.translate("text_payment"),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText1,
                            fontWeight: 600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: customAppTheme.bgLayer2,
                            borderRadius: BorderRadius.all(
                                Radius.circular(MySize.size8))),
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  methodType = 0;
                                });
                              },
                              child: singlePayment(
                                  isSelected: methodType == 0,
                                  method: Translator.translate("text_wallet") +
                                      " / " +
                                      Translator.translate("text_UPI")),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  methodType = 1;
                                });
                              },
                              child: singlePayment(
                                  isSelected: methodType == 1,
                                  method:
                                      Translator.translate("text_Net_Banking")),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  methodType = 2;
                                });
                              },
                              child: singlePayment(
                                  isSelected: methodType == 2,
                                  method: Translator.translate("text_credit") +
                                      " / " +
                                      Translator.translate("text_debit")),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  methodType = 3;
                                });
                              },
                              child: singlePayment(
                                  isSelected: methodType == 3,
                                  method: Translator.translate(
                                      "text_Cash_on_Delivery")),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size24,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "FLAT40",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 600,
                                        muted: true),
                                  ),
                                  Text("- 40% at max 100\$",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          fontSize: 12,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 400,
                                          letterSpacing: -0.2))
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShoppingCouponScreen()));
                                },
                                child: Text(
                                  "Change coupon",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: themeData.colorScheme.primary,
                                      fontWeight: 600),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  Translator.translate("text_coupon_discount") +
                                      "  ",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600),
                                ),
                                Text("-\$ 19.99",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        muted: true,
                                        fontWeight: 600))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: MySize.size16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  Translator.translate("text_total") + "  ",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600),
                                ),
                                Text("\$ 79.99",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText1,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        muted: true,
                                        fontWeight: 600))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24),
                      child: Center(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(MySize.size8)),
                          color: themeData.colorScheme.primary,
                          splashColor: Colors.white.withAlpha(100),
                          highlightColor: themeData.colorScheme.primary,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShoppingOrderPlaceScreen()));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                Translator.translate("text_proceed")
                                    .toUpperCase(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    letterSpacing: 0.4,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: MySize.size16),
                                  child: Icon(
                                    MdiIcons.chevronRight,
                                    color: themeData.colorScheme.onPrimary,
                                    size: MySize.size16,
                                  ))
                            ],
                          ),
                          padding: EdgeInsets.only(
                              top: MySize.size12,
                              left: MySize.size32,
                              bottom: MySize.size12,
                              right: MySize.size32),
                        ),
                      ),
                    )
                  ],
                )));
      },
    );
  }

  Widget singlePayment({String method, bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected
              ? themeData.colorScheme.primary
              : customAppTheme.bgLayer1,
          borderRadius: isSelected
              ? BorderRadius.all(Radius.circular(MySize.size8))
              : BorderRadius.zero),
      padding: EdgeInsets.only(
          top: MySize.size24,
          bottom: MySize.size24,
          left: MySize.size32,
          right: MySize.size32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            method,
            style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                color: isSelected
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground,
                fontWeight: 600,
                letterSpacing: 0.3),
          ),
          isSelected
              ? Container(
                  width: MySize.size20,
                  height: MySize.size20,
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.onPrimary,
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size16))),
                  child: Icon(
                    MdiIcons.check,
                    color: themeData.colorScheme.primary,
                    size: MySize.size16,
                  ),
                )
              : Container(
                  width: MySize.size20,
                  height: MySize.size20,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              themeData.colorScheme.onBackground.withAlpha(60),
                          width: 1.6),
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size16))),
                ),
        ],
      ),
    );
  }
}
