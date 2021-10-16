import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingOrderScreen extends StatefulWidget {
  @override
  _ShoppingOrderScreenState createState() => _ShoppingOrderScreenState();
}

class _ShoppingOrderScreenState extends State<ShoppingOrderScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  @override
  void initState() {
    super.initState();
  }

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
              child: Container(
                child: ListView(
                  padding: EdgeInsets.only(
                      left: MySize.size24, right: MySize.size24),
                  children: [
                    singleOrderItem(
                        price: 49.49,
                        time: "12 April 2020, 1:45",
                        listItem: [
                          "./assets/product/product-1.jpg",
                          "./assets/product/product-2.jpg",
                          "./assets/product/product-3.jpg",
                          "./assets/product/product-4.jpg"
                        ],
                        number: 45698,
                        status: Translator.translate("text_in_progress")),
                    singleOrderItem(
                        price: 54.99,
                        time: "14 Feb 2020, 12:04",
                        listItem: [
                          "./assets/product/product-5.jpg",
                          "./assets/product/product-3.jpg"
                        ],
                        number: 1478,
                        status: Translator.translate("text_delivered")),
                    singleOrderItem(
                        price: 69.99,
                        time: "16 Dec 2019, 8:48",
                        listItem: [
                          "./assets/product/product-9.jpg",
                          "./assets/product/product-7.jpg",
                          "./assets/product/product-10.jpg",
                        ],
                        number: 1478,
                        status: Translator.translate("text_delivered")),
                  ],
                ),
              ),
            )));
      },
    );
  }

  Widget singleOrderItem(
      {List<String> listItem,
      int number,
      String time,
      String status,
      double price}) {
    //Logic for row items
    double space = MySize.size16;
    double width =
        (MySize.screenWidth - MySize.getScaledSizeHeight(83) - (2 * space)) / 3;

    List<Widget> _itemWidget = [];
    for (int i = 0; i < listItem.length; i++) {
      if (i == 2 && listItem.length > 3) {
        _itemWidget.add(
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
            child: Container(
              color: customAppTheme.bgLayer3,
              height: width,
              width: width,
              child: Center(
                  child: Text(
                "+" + (listItem.length - 2).toString(),
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    letterSpacing: 0.5,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 600),
              )),
            ),
          ),
        );
        break;
      } else {
        _itemWidget.add(
          Container(
            margin: (i == 2) ? EdgeInsets.zero : EdgeInsets.only(right: space),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
              child: Image.asset(
                listItem[i],
                height: width,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      }
    }

    return Container(
      padding: EdgeInsets.all(MySize.size16),
      margin: EdgeInsets.only(top: MySize.size8, bottom: MySize.size8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
        color: customAppTheme.bgLayer1,
        border: Border.all(color: customAppTheme.bgLayer3, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Order $number",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.subtitle1,
                          fontWeight: 700,
                          letterSpacing: -0.2),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size4),
                      child: Text(
                        "\$ $price",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            fontWeight: 600,
                            letterSpacing: 0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MySize.size12,
                    right: MySize.size12,
                    top: MySize.size8,
                    bottom: MySize.size8),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size4)),
                    color: customAppTheme.bgLayer3),
                child: Text(
                  status.toUpperCase(),
                  style: AppTheme.getTextStyle(themeData.textTheme.caption,
                      fontWeight: 700, letterSpacing: 0),
                ),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: MySize.size16),
              child: Text(time,
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                      fontWeight: 600,
                      letterSpacing: -0.2,
                      color:
                          themeData.colorScheme.onBackground.withAlpha(160)))),
          Container(
            margin: EdgeInsets.only(top: MySize.size16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _itemWidget,
            ),
          ),
        ],
      ),
    );
  }
}
