import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/screens/TermsScreen.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingCouponScreen extends StatefulWidget {
  @override
  _ShoppingCouponScreenState createState() => _ShoppingCouponScreenState();
}

class _ShoppingCouponScreenState extends State<ShoppingCouponScreen> {
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
                  title: Text(Translator.translate("text_coupons"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: Container(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size8,
                            left: MySize.size16,
                            right: MySize.size16,
                            bottom: MySize.size8),
                        child: Text(
                          Translator.translate("text_active").toUpperCase(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              muted: true,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 700),
                        ),
                      ),
                      singleCoupon(
                          image: "./assets/image/offer-1.png",
                          offer: Translator.translate("text_coupons_offer_1"),
                          expireDate: "04 Jun 2020"),
                      singleCoupon(
                          image: "./assets/image/offer-1.png",
                          offer: Translator.translate("text_coupons_offer_2"),
                          expireDate: "16 July 2020"),
                      Container(
                          margin: EdgeInsets.only(
                              top: MySize.size8,
                              left: MySize.size16,
                              right: MySize.size16,
                              bottom: MySize.size8),
                          child: Text(
                              Translator.translate("text_upcoming")
                                  .toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  muted: true,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 700))),
                      singleCoupon(
                          image: "./assets/image/offer-2.png",
                          offer: Translator.translate("text_coupons_offer_1"),
                          comingDate: "04 Aug 2020",
                          isActive: false),
                      singleCoupon(
                          image: "./assets/image/offer-2.png",
                          offer: Translator.translate("text_coupons_offer_2"),
                          comingDate: "16 Aug 2020",
                          isActive: false),
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleCoupon(
      {String image,
      String offer,
      String expireDate,
      bool isActive = true,
      String comingDate}) {
    return Container(
      margin: EdgeInsets.only(
          left: MySize.size16,
          right: MySize.size16,
          top: MySize.size8,
          bottom: MySize.size8),
      padding: EdgeInsets.all(MySize.size16),
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
          boxShadow: [
            BoxShadow(
                color: themeData.cardTheme.shadowColor.withAlpha(20),
                blurRadius: MySize.size4,
                offset: Offset(0, MySize.size4))
          ]),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: MySize.size48,
                height: MySize.size48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: MySize.size16),
                    child: Text(offer,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600,
                            letterSpacing: 0.2))),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          isActive
                              ? Translator.translate("text_expires")
                              : Translator.translate("text_coming_at"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.caption,
                              muted: true,
                              fontWeight: 500),
                        ),
                        Text(
                          isActive ? expireDate : comingDate,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size8),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TermsScreen()));
                            },
                            child: Text(
                              Translator.translate(
                                  "text_terms_and_condition_apply"),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  color: themeData.colorScheme.primary,
                                  muted: true,
                                  fontSize: 12,
                                  letterSpacing: 0,
                                  fontWeight: 600),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(MySize.size24)),
                      color: isActive
                          ? themeData.colorScheme.primary
                          : customAppTheme.disabledColor,
                      highlightColor: isActive
                          ? themeData.colorScheme.primary
                          : customAppTheme.disabledColor,
                      padding: EdgeInsets.only(
                          left: MySize.size32, right: MySize.size32),
                      splashColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                          isActive
                              ? Translator.translate("text_apply")
                              : Translator.translate("text_activate"),
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.button,
                            fontSize: 13,
                            fontWeight: 600,
                            color: isActive
                                ? themeData.colorScheme.onPrimary
                                : customAppTheme.onDisabled,
                            letterSpacing: 0.5,
                          ))),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
