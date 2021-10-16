import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import 'ShoppingProductScreen.dart';

class HomeScreen extends StatefulWidget {
  final BuildContext rootContext;

  const HomeScreen({Key key, @required this.rootContext}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;

  bool _grocery = false, _cloth = true, _liquor = false, _food = true;

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
                  padding: EdgeInsets.only(
                      bottom: MySize.size16,
                      left: MySize.size16,
                      right: MySize.size16),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: themeData.colorScheme.surface),
                        color: themeData.cardTheme.color,
                        borderRadius:
                            BorderRadius.all(Radius.circular(MySize.size8)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                themeData.cardTheme.shadowColor.withAlpha(18),
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _grocery = !_grocery;
                                });
                              },
                              child: _CategoryWidget(
                                iconData: MdiIcons.cartOutline,
                                actionText:
                                    Translator.translate("text_grocery"),
                                isSelected: _grocery,
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _cloth = !_cloth;
                                });
                              },
                              child: _CategoryWidget(
                                iconData: MdiIcons.hanger,
                                actionText: Translator.translate("text_cloth"),
                                isSelected: _cloth,
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _liquor = !_liquor;
                                });
                              },
                              child: _CategoryWidget(
                                iconData: MdiIcons.glassWine,
                                actionText: Translator.translate("text_liquor"),
                                isSelected: _liquor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _food = !_food;
                                });
                              },
                              child: _CategoryWidget(
                                  iconData: MdiIcons.food,
                                  isSelected: _food,
                                  actionText:
                                      Translator.translate("text_food")),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: MySize.size16),
                        child: _ProductListWidget(
                          name: "Cosmic bang",
                          image: './assets/product/product-7.jpg',
                          sales: 990,
                          star: 4.5,
                          price: 120,
                          buildContext: context,
                        )),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: _ProductListWidget(
                        name: "Colorful sandal",
                        image: './assets/product/product-8.jpg',
                        sales: 149,
                        star: 3.8,
                        price: 149,
                        buildContext: context,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: _ProductListWidget(
                        name: "Yellow cake",
                        image: './assets/product/product-1.jpg',
                        sales: 24,
                        buildContext: context,
                        star: 4,
                        price: 157,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: _ProductListWidget(
                        name: "Toffees",
                        image: './assets/product/product-2.jpg',
                        sales: 790,
                        buildContext: context,
                        star: 5,
                        price: 49,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Text(Translator.translate("text_recommended"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700,
                              letterSpacing: -0.2)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: _ProductListWidget(
                        name: "Sweet Gems",
                        image: './assets/product/product-5.jpg',
                        sales: 190,
                        buildContext: context,
                        star: 3,
                        price: 29,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: _ProductListWidget(
                        name: "Lipsticks",
                        image: './assets/product/product-4.jpg',
                        sales: 148,
                        buildContext: context,
                        star: 4,
                        price: 48,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: _ProductListWidget(
                        name: "Candies",
                        image: './assets/product/product-3.jpg',
                        sales: 154,
                        buildContext: context,
                        star: 4,
                        price: 17,
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image;
  final int sales;
  final double star;
  final int price;
  final BuildContext buildContext;

  const _ProductListWidget(
      {Key key,
      @required this.name,
      @required this.image,
      @required this.star,
      @required this.price,
      @required this.buildContext,
      this.sales})
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
              color: themeData.cardTheme.shadowColor.withAlpha(26),
              blurRadius: 5,
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
                                fontWeight: 700,
                                letterSpacing: 0)),
                        Icon(
                          MdiIcons.heart,
                          color:
                              themeData.colorScheme.onBackground.withAlpha(80),
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
                                  fontWeight: 700)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: MySize.size4),
                              child: Text(
                                widget.sales.toString() +
                                    " " +
                                    Translator.translate("text_sales"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.caption,
                                    color: themeData.colorScheme.onBackground,
                                    letterSpacing: 0,
                                    fontWeight: 500),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "\$ " + widget.price.toString(),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 800),
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

class _CategoryWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;
  final bool isSelected;

  const _CategoryWidget(
      {Key key,
      @required this.iconData,
      @required this.actionText,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(top: MySize.size12, bottom: MySize.size12),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: isSelected
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.primary.withAlpha(20),
              child: SizedBox(
                  width: 52,
                  height: 52,
                  child: Icon(
                    iconData,
                    color: isSelected
                        ? themeData.colorScheme.onPrimary
                        : themeData.colorScheme.primary,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MySize.size8),
            child: Text(
              actionText,
              style: AppTheme.getTextStyle(themeData.textTheme.caption,
                  fontWeight: 600, letterSpacing: 0),
            ),
          )
        ],
      ),
    );
  }
}
