import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
                key: _scaffoldKey,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: customAppTheme.bgLayer2,
                  centerTitle: true,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: themeData.colorScheme.onBackground,
                    ),
                  ),
                  title: Text(Translator.translate("text_cart"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                body: Container(
                  color: customAppTheme.bgLayer2,
                  child: Container(
                    child: ListView(
                      padding: EdgeInsets.only(
                        top: MySize.size8,
                      ),
                      children: <Widget>[
                        SingleCartItem(
                            themeType: themeType,
                            image: './assets/product/product-1.jpg',
                            price: 19.99,
                            name: "Pumpkin\nCream"),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: SingleCartItem(
                              themeType: themeType,
                              image: './assets/product/product-2.jpg',
                              price: 27.89,
                              name: "Carrom\nRoll"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: SingleCartItem(
                              themeType: themeType,
                              image: './assets/product/product-5.jpg',
                              price: 39.79,
                              name: "Other\nSeed"),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: MySize.size24,
                              right: MySize.size24,
                              top: MySize.size16),
                          child: Divider(),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: MySize.size24,
                              right: MySize.size24,
                              top: MySize.size16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                Translator.translate("text_discount"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    color: themeData.colorScheme.onBackground,
                                    fontWeight: 600,
                                    muted: true),
                              ),
                              Text("-\$9.99",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600,
                                      letterSpacing: 0,
                                      muted: true))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: MySize.size24,
                              right: MySize.size24,
                              top: MySize.size16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                Translator.translate("text_total"),
                                style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle1,
                                  fontWeight: 700,
                                  color: themeData.colorScheme.onBackground,
                                ),
                              ),
                              Text("\$79.99",
                                  style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 700,
                                    color: themeData.colorScheme.onBackground,
                                    letterSpacing: 0,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(MySize.size24),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(MySize.size8)),
                            color: themeData.colorScheme.primary.withAlpha(220),
                            splashColor: Colors.white.withAlpha(100),
                            highlightColor:
                                themeData.colorScheme.primary.withAlpha(220),
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      Translator.translate("text_checkout")
                                          .toUpperCase(),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText1,
                                          letterSpacing: 0.4,
                                          fontWeight: 600,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: MySize.size16,
                                      right: MySize.size16,
                                      top: MySize.size8,
                                      bottom: MySize.size8),
                                  decoration: BoxDecoration(
                                      color: themeData.colorScheme.primary,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8))),
                                  child: Icon(
                                    MdiIcons.cartArrowRight,
                                    color: themeData.colorScheme.onPrimary,
                                    size: MySize.size24,
                                  ),
                                )
                              ],
                            ),
                            padding: EdgeInsets.only(
                                top: MySize.size8,
                                bottom: MySize.size8,
                                right: MySize.size16),
                          ),
                        )
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}

class SingleCartItem extends StatefulWidget {
  final String image, name;
  final double price;
  final int themeType, initialAmount;

  const SingleCartItem(
      {Key key,
      this.image,
      this.name,
      this.price,
      this.themeType = 1,
      this.initialAmount = 1})
      : super(key: key);

  @override
  _SingleCartItemState createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  int amount;

  @override
  void initState() {
    super.initState();
    amount = widget.initialAmount;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    customAppTheme = AppTheme.getCustomAppTheme(widget.themeType);

    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: customAppTheme.bgLayer3,
      ),
      secondaryBackground: Container(
        color: customAppTheme.bgLayer3,
        padding: EdgeInsets.symmetric(horizontal: MySize.size20),
        alignment: AlignmentDirectional.centerEnd,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: MySize.size16),
              padding: EdgeInsets.all(MySize.size10),
              decoration: BoxDecoration(
                  color: themeData.errorColor.withAlpha(40),
                  shape: BoxShape.circle),
              child: Icon(
                MdiIcons.deleteOutline,
                size: MySize.size26,
                color: themeData.errorColor,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          setState(() {
            //TODO: perform delete operation
          });
        }
      },
      key: UniqueKey(),
      child: Container(
        padding: EdgeInsets.only(left: MySize.size24, right: MySize.size24),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
              child: Image.asset(
                widget.image,
                height: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.3,
                margin: EdgeInsets.only(left: MySize.size24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          widget.name,
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600),
                        )),
                        Text(
                          "\$" + "${widget.price}",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground
                                  .withAlpha(180),
                              fontWeight: 600,
                              letterSpacing: -0.2,
                              muted: true),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: customAppTheme.bgLayer3,
                          borderRadius:
                              BorderRadius.all(Radius.circular(MySize.size8))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (amount > 1) amount--;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                  left: MySize.size12,
                                  top: MySize.size8,
                                  right: MySize.size8,
                                  bottom: MySize.size8,
                                ),
                                child: Icon(
                                  MdiIcons.minus,
                                  size: MySize.size18,
                                  color: themeData.colorScheme.onBackground,
                                )),
                          ),
                          Text(
                            '$amount',
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500,
                                letterSpacing: 0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                amount++;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                  left: MySize.size8,
                                  top: MySize.size8,
                                  right: MySize.size12,
                                  bottom: MySize.size8,
                                ),
                                child: Icon(
                                  MdiIcons.plus,
                                  size: MySize.size18,
                                  color: themeData.colorScheme.onBackground,
                                )),
                          ),
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
    );
  }
}
