import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import 'ShoppingDeliveryAddressScreen.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                backgroundColor: themeData.backgroundColor,
                body: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size0,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: _CartItemWidget(
                          name: "Cup Cake",
                          image: './assets/product/product-1.jpg',
                          price: 159,
                          count: 2),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size16,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: _CartItemWidget(
                          name: "Woo Sandal",
                          image: './assets/product/product-8.jpg',
                          price: 299,
                          count: 1),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size16,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: _CartItemWidget(
                          name: "High-Low ",
                          image: './assets/product/product-7.jpg',
                          price: 459,
                          count: 3),
                    ),
                    _CardBillWidget(),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8)),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    themeData.colorScheme.primary.withAlpha(20),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: FlatButton(
                              padding:
                                  EdgeInsets.symmetric(vertical: MySize.size12),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(MySize.size4)),
                              color: themeData.colorScheme.primary,
                              highlightColor: themeData.colorScheme.primary,
                              splashColor: Colors.white.withAlpha(100),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShoppingDeliveryAddressScreen()));
                              },
                              child: Text(
                                  Translator.translate("text_checkout")
                                      .toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.onPrimary,
                                      letterSpacing: 0.5))),
                        ),
                      ),
                    )
                  ],
                )));
      },
    );
  }
}

class _CardBillWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MySize.size16, horizontal: MySize.size24),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                Translator.translate("text_subtotal"),
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
              ),
              Text(
                "\$  299.99",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  Translator.translate("text_shipping_cost"),
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
                ),
                Text(
                  "\$  49.59",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
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
                  Translator.translate("text_taxes"),
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
                ),
                Text(
                  "\$  29.99",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1),
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
                  Translator.translate("text_total"),
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 800),
                ),
                Text(
                  "\$  399.89",
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 800),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItemWidget extends StatefulWidget {
  final String name, image;
  final int price, count;

  const _CartItemWidget(
      {Key key,
      @required this.name,
      @required this.image,
      @required this.price,
      @required this.count})
      : super(key: key);

  @override
  __CartItemWidgetState createState() => __CartItemWidgetState();
}

class __CartItemWidgetState extends State<_CartItemWidget> {
  ThemeData themeData;

  int _count;

  @override
  void initState() {
    super.initState();
    _count = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: themeData.cardTheme.color,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
        boxShadow: [
          BoxShadow(
            color: themeData.cardTheme.shadowColor.withAlpha(26),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
            child: Image.asset(
              widget.image,
              height: MySize.getScaledSizeHeight(90),
              fit: BoxFit.fill,
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
                  Text(widget.name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 600,
                          letterSpacing: 0)),
                  Text(
                    "\$ " + widget.price.toString(),
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 700, letterSpacing: 0),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeData.colorScheme.primary,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size4)),
                        boxShadow: [
                          BoxShadow(
                            color: themeData.colorScheme.primary.withAlpha(28),
                            blurRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              if (_count > 1) {
                                setState(() {
                                  _count--;
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.all(MySize.size8),
                              child: Icon(
                                MdiIcons.minus,
                                color: themeData.colorScheme.onPrimary,
                                size: MySize.size20,
                              ),
                            ),
                          ),
                          Container(
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 250),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return ScaleTransition(
                                    child: child, scale: animation);
                              },
                              child: Text(
                                '$_count',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary),
                                key: ValueKey<int>(_count),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _count++;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(MySize.size8),
                              child: Icon(MdiIcons.plus,
                                  color: themeData.colorScheme.onPrimary,
                                  size: MySize.size20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
