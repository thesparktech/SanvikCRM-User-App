import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class SingleCategoryScreen extends StatefulWidget {
  @override
  _SingleCategoryScreenState createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
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
                  backgroundColor: customAppTheme.bgLayer2,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(MdiIcons.chevronLeft),
                  ),
                  title: Text(Translator.translate("text_camera"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: customAppTheme.bgLayer2,
                body: Container(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: MySize.size24),
                        child: Text(
                          Translator.translate("text_top_category"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700,
                              color: themeData.colorScheme.onBackground,
                              letterSpacing: 0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: MySize.size24),
                                child: singleType(
                                    title: 'Camera\nCompact',
                                    image:
                                        './assets/product/camera/camera-1.jpg'),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: MySize.size16),
                                child: singleType(
                                    title: 'DSLR',
                                    image:
                                        './assets/product/camera/camera-2.jpg'),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: MySize.size16, right: MySize.size24),
                                child: singleType(
                                    title: 'Mirrorless',
                                    image:
                                        './assets/product/camera/camera-3.jpg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size24, left: MySize.size24),
                        child: Text(
                          Translator.translate("text_sub_category"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700,
                              color: themeData.colorScheme.onBackground),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size16,
                            left: MySize.size24,
                            right: MySize.size24),
                        child: Wrap(
                          runSpacing: MySize.size12,
                          spacing: MySize.size12,
                          children: <Widget>[
                            singleSubCategory(
                                subCategory:
                                    Translator.translate("text_drone")),
                            singleSubCategory(
                                subCategory:
                                    Translator.translate("text_analog")),
                            singleSubCategory(
                                subCategory:
                                    Translator.translate("text_digital")),
                            singleSubCategory(
                                subCategory:
                                    Translator.translate("text_compact")),
                            singleSubCategory(
                                subCategory: Translator.translate("text_spy")),
                            singleSubCategory(
                                subCategory: Translator.translate("text_CCTV")),
                            singleSubCategory(
                                subCategory:
                                    Translator.translate("text_accessories")),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MySize.size24, left: MySize.size24),
                        child: Text(
                          Translator.translate("text_related"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700,
                              color: themeData.colorScheme.onBackground,
                              letterSpacing: 0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size24,
                            right: MySize.size24,
                            top: MySize.size16,
                            bottom: MySize.size24),
                        child: Column(
                          children: <Widget>[
                            ProductListWidget(
                                name: 'Film Camera',
                                image: './assets/product/camera/camera-3.jpg',
                                shopName: 'G Camera',
                                star: 4.5,
                                price: 299),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: ProductListWidget(
                                  name: 'Bridge Camera',
                                  image: './assets/product/camera/camera-2.jpg',
                                  shopName: 'Reliance',
                                  star: 4.5,
                                  price: 799),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: ProductListWidget(
                                  name: 'Instant Camera',
                                  image: './assets/product/camera/camera-1.jpg',
                                  shopName: 'Sony',
                                  star: 4.5,
                                  price: 999),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
      },
    );
  }

  Widget singleType({String image, String title}) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
            child: Image(
              image: AssetImage(image),
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: MySize.size16,
            left: MySize.size16,
            child: Center(
              child: Text(
                title,
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                    color: Colors.white, fontWeight: 700),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget singleSubCategory({String subCategory}) {
    return Container(
      decoration: BoxDecoration(
          color: customAppTheme.bgLayer1,
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
          boxShadow: [
            BoxShadow(
                color: themeData.cardTheme.shadowColor.withAlpha(8),
                blurRadius: MySize.size12,
                offset: Offset(0, MySize.size4))
          ]),
      padding: EdgeInsets.only(
          left: MySize.size12,
          right: MySize.size12,
          top: MySize.size6,
          bottom: MySize.size6),
      child: Text(
        subCategory,
        style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
            color: themeData.colorScheme.onBackground,
            fontWeight: 500,
            letterSpacing: 0.2),
      ),
    );
  }
}

class ProductListWidget extends StatefulWidget {
  final String name, image, shopName;
  final double star;
  final int price;

  const ProductListWidget(
      {Key key,
      @required this.name,
      @required this.image,
      @required this.shopName,
      @required this.star,
      @required this.price})
      : super(key: key);

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
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
                        color: themeData.colorScheme.onBackground.withAlpha(75),
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
    );
  }
}
