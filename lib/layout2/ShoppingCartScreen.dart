import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout2/ShoppingCheckoutScreen.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  List<int> _cartQtyList;

  @override
  void initState() {
    super.initState();
    _cartQtyList = [5, 2, 4];
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
                key: _scaffoldKey,
                body: Container(
                  color: customAppTheme.bgLayer2,
                  child: ListView(
                    padding: EdgeInsets.only(
                        left: MySize.size24,
                        right: MySize.size24,
                        top: MySize.size8),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          singleCartItem(
                              image: './assets/product/product-1.jpg',
                              price: 35.79,
                              name: 'Cup Cake',
                              index: 0),
                          singleCartItem(
                              image: './assets/product/product-2.jpg',
                              price: 35.79,
                              name: 'Roll',
                              index: 1),
                          singleCartItem(
                              image: './assets/product/product-8.jpg',
                              price: 35.79,
                              name: 'Sandals',
                              index: 2),
                        ],
                      ),
                      Divider(
                        height: MySize.size24,
                      ),
                      _CardBillWidget(),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size24),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(MySize.size4)),
                          color: themeData.colorScheme.primary,
                          splashColor: Colors.white.withAlpha(100),
                          highlightColor: themeData.colorScheme.primary,
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
                                    "\$ 449.89",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        letterSpacing: 0.3,
                                        fontWeight: 600,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(MySize.size10),
                                decoration: BoxDecoration(
                                    color: themeData.colorScheme.primaryVariant,
                                    shape: BoxShape.circle),
                                child: Icon(
                                  MdiIcons.cartArrowRight,
                                  color: themeData.colorScheme.onPrimary,
                                  size: MySize.size18,
                                ),
                              )
                            ],
                          ),
                          padding: EdgeInsets.only(
                              top: MySize.size6,
                              bottom: MySize.size6,
                              right: MySize.size16),
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleCartItem({String image, String name, double price, int index}) {
    final GlobalKey _simpleMenuKey = new GlobalKey();
    List<int> _list = new List<int>.generate(5, (i) => i + 1);

    return Container(
      margin: EdgeInsets.only(top: MySize.size12, bottom: MySize.size12),
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              MdiIcons.minusCircleOutline,
              color: themeData.colorScheme.onBackground.withAlpha(200),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: MySize.size8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size8)),
                    child: Image.asset(
                      image,
                      height: MySize.screenWidth * 0.23,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: MySize.size16),
                      height: MySize.screenWidth * 0.23,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: PopupMenuButton(
                                    key: _simpleMenuKey,
                                    onSelected: (item) {
                                      setState(() {
                                        _cartQtyList[index] = item;
                                      });
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return _list.map((int option) {
                                        return PopupMenuItem(
                                          value: option,
                                          height: MySize.size36,
                                          child: Text(option.toString(),
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  color: themeData.colorScheme
                                                      .onBackground)),
                                        );
                                      }).toList();
                                    },
                                    color: themeData.backgroundColor,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: MySize.size12,
                                          right: MySize.size12,
                                          top: MySize.size8,
                                          bottom: MySize.size8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8)),
                                        color: customAppTheme.bgLayer1,
                                        border: Border.all(
                                            color: customAppTheme.bgLayer3,
                                            width: 1),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            _cartQtyList[index].toString(),
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.bodyText1,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                                fontWeight: 500),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: MySize.size4),
                                            child: Icon(
                                              MdiIcons.chevronDown,
                                              size: MySize.size22,
                                              color: themeData
                                                  .colorScheme.onBackground,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                              Text(
                                "\$$price",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 700,
                                    letterSpacing: 0),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CardBillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.only(top: MySize.size16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                Translator.translate("text_subtotal"),
                style: AppTheme.getTextStyle(
                  themeData.textTheme.subtitle1,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 500,
                ),
              ),
              Text(
                "\$ 399.99",
                style: AppTheme.getTextStyle(
                  themeData.textTheme.subtitle1,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 500,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  Translator.translate("text_charges"),
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 500,
                  ),
                ),
                Text(
                  "+ \$ 59.59",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  Translator.translate("text_discount"),
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 500,
                  ),
                ),
                Text(
                  "- \$ 9.99",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
