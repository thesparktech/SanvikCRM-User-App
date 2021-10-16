import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout2/ShoppingProductScreen.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  List<bool> _list;

  @override
  void initState() {
    super.initState();
    _list = List.generate(8, (index) => false);
  }

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: customAppTheme.bgLayer2,
                body: Container(
                    margin: EdgeInsets.only(top: MySize.size8),
                    child: ListView(
                      padding: EdgeInsets.only(bottom: MySize.size8),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size16, right: MySize.size16),
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText1,
                                letterSpacing: 0.1,
                                color: themeData.colorScheme.onBackground),
                            decoration: InputDecoration(
                              hintText: Translator.translate(
                                  "text_search_product_name"),
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  letterSpacing: 0.1,
                                  color: themeData.colorScheme.onBackground),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8),
                                  ),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8),
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8),
                                  ),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: customAppTheme.bgLayer3,
                              prefixIcon: Icon(MdiIcons.magnify,
                                  size: 22,
                                  color: themeData.colorScheme.onBackground),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            textInputAction: TextInputAction.search,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16),
                          child: Column(
                            children: <Widget>[
                              singleProduct(
                                  image: "./assets/product/product-1.jpg",
                                  name: "Cup Cake",
                                  rate: 4.5,
                                  price: 35.79,
                                  index: 0),
                              singleProduct(
                                  image: "./assets/product/product-2.jpg",
                                  name: "Gem Roll",
                                  rate: 4,
                                  price: 35.79,
                                  index: 1),
                              singleProduct(
                                  image: "./assets/product/product-5.jpg",
                                  name: "Seeds",
                                  rate: 5,
                                  price: 35.79,
                                  index: 2),
                              singleProduct(
                                  image: "./assets/product/product-7.jpg",
                                  name: "Sprays",
                                  rate: 3.5,
                                  price: 35.79,
                                  index: 3),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MySize.size24,
                              right: MySize.size24,
                              top: MySize.size16),
                          child: Text(
                              Translator.translate("text_trends").toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  color: themeData.colorScheme.onBackground,
                                  muted: true,
                                  fontWeight: 700)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16),
                          child: Column(
                            children: <Widget>[
                              singleProduct(
                                  image: "./assets/product/product-1.jpg",
                                  name: "Cup Cake",
                                  rate: 4.5,
                                  price: 35.79,
                                  index: 4),
                              singleProduct(
                                  image: "./assets/product/product-2.jpg",
                                  name: "Gem Roll",
                                  rate: 4,
                                  price: 35.79,
                                  index: 5),
                              singleProduct(
                                  image: "./assets/product/product-5.jpg",
                                  name: "Seeds",
                                  rate: 5,
                                  price: 35.79,
                                  index: 6),
                              singleProduct(
                                  image: "./assets/product/product-7.jpg",
                                  name: "Sprays",
                                  rate: 3.5,
                                  price: 35.79,
                                  index: 7),
                            ],
                          ),
                        ),
                      ],
                    ))));
      },
    );
  }

  Widget singleProduct(
      {String image,
      String name,
      double rate,
      double price,
      @required int index}) {
    String tag = Generator.randomString(10);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShoppingProductScreen(
                      heroTag: tag,
                      image: image,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: MySize.size16,
            right: MySize.size16,
            top: MySize.size8,
            bottom: MySize.size8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: customAppTheme.bgLayer1,
            boxShadow: [
              BoxShadow(
                  blurRadius: MySize.size16,
                  color: themeData.cardTheme.shadowColor.withAlpha(8))
            ],
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8))),
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(MySize.size16),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size8)),
                    child: Hero(
                      tag: tag,
                      child: Image(
                        image: AssetImage(image),
                        height: MySize.getScaledSizeHeight(96),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MySize.getScaledSizeHeight(96),
                      margin: EdgeInsets.only(left: MySize.size16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                          Generator.buildRatingStar(
                              rating: rate,
                              inactiveColor: Generator.starColor,
                              spacing: 0),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "\$ ",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.caption,
                                      color: themeData.colorScheme.onBackground,
                                      muted: true,
                                      letterSpacing: -0.5,
                                      fontWeight: 600)),
                              TextSpan(
                                  text: "$price",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      letterSpacing: -0.2,
                                      color: themeData.colorScheme.onBackground,
                                      fontWeight: 600)),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _list[index] = !_list[index];
                      //homeProduct.isFavourite = !homeProduct.isFavourite;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MySize.size12,
                        top: MySize.size8,
                        right: MySize.size12,
                        bottom: MySize.size8),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(40),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(MySize.size8),
                            bottomRight: Radius.circular(MySize.size8))),
                    child: Icon(
                      _list[index] ? MdiIcons.check : MdiIcons.plus,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
