import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout2/ShoppingCheckoutScreen.dart';
import 'package:SanvikSystem/layout2/ShoppingProductReviewScreen.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingProductScreen extends StatefulWidget {
  final String heroTag, image;

  const ShoppingProductScreen(
      {Key key,
      this.heroTag = "heroTag",
      this.image = './assets/product/product-5.jpg'})
      : super(key: key);

  @override
  _ShoppingProductScreenState createState() => _ShoppingProductScreenState();
}

class _ShoppingProductScreenState extends State<ShoppingProductScreen>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;
  int selectedSize = 11;
  CustomAppTheme customAppTheme;

  Widget build(BuildContext context) {
    return Consumer<AppThemeNotifier>(
      builder:
          (BuildContext buildContext, AppThemeNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        themeData = AppTheme.getThemeFromThemeMode(value.themeMode());
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: customAppTheme.bgLayer2,
                    elevation: 0,
                    leading: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        MdiIcons.chevronLeft,
                        color: themeData.colorScheme.onBackground,
                      ),
                    ),
                    title: Text("Febreze AIR",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 600)),
                  ),
                  backgroundColor: customAppTheme.bgLayer2,
                  body: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size24),
                                  child: Hero(
                                    tag: widget.heroTag,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(MySize.size8)),
                                      child: Image.asset(
                                        widget.image,
                                        width: MySize.safeHeight * 0.3,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size24),
                                  child: Text(
                                    "Febreze AIR",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.headline6,
                                        fontWeight: 700,
                                        letterSpacing: 0),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: MySize.size16),
                                    child: Text(
                                      Generator.getDummyText(6),
                                      style: AppTheme.getTextStyle(
                                        themeData.textTheme.caption,
                                        letterSpacing: 0,
                                        fontWeight: 500,
                                      ),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size16),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Generator.buildRatingStar(
                                            rating: 4.5,
                                            spacing: 1,
                                            size: MySize.size24),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: MySize.size8),
                                          child: RichText(
                                            text: TextSpan(children: <TextSpan>[
                                              TextSpan(
                                                text: "4.5",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2,
                                                    fontWeight: 700,
                                                    color: themeData.colorScheme
                                                        .onBackground,
                                                    letterSpacing: 0),
                                              ),
                                              TextSpan(
                                                text: "/5.0",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2,
                                                    fontWeight: 600,
                                                    color: themeData.colorScheme
                                                        .onBackground
                                                        .withAlpha(200),
                                                    letterSpacing: 0),
                                              ),
                                            ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: MySize.size48),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        width: MySize.size48,
                                        height: MySize.size48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(100),
                                              width: 1.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size12)),
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            MdiIcons.shareOutline,
                                            size: MySize.size24,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MySize.size32),
                                        width: MySize.size48,
                                        height: MySize.size48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: themeData
                                                  .colorScheme.onBackground
                                                  .withAlpha(100),
                                              width: 1.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size12)),
                                          color: Colors.transparent,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            MdiIcons.bookmarkOutline,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MySize.size32),
                                        width: MySize.size48,
                                        height: MySize.size48,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size12)),
                                          color: themeData.colorScheme.primary,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            MdiIcons.heart,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MySize.size32,
                                      bottom: MySize.size16),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            _selectSizeSheet(context);
                                          },
                                          child: Container(
                                            width: MySize.safeWidth * 0.4,
                                            decoration: BoxDecoration(
                                              color: themeData.backgroundColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      MySize.size12)),
                                            ),
                                            padding: EdgeInsets.only(
                                                top: MySize.size16,
                                                bottom: MySize.size16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  MdiIcons.imageSizeSelectSmall,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  size: MySize.size24,
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: MySize.size8),
                                                    child: Text(
                                                      Translator.translate(
                                                          "text_change"),
                                                      style:
                                                          AppTheme.getTextStyle(
                                                        themeData.textTheme
                                                            .bodyText1,
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground,
                                                        fontWeight: 600,
                                                        letterSpacing: -0.2,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShoppingProductReviewScreen()));
                                          },
                                          child: Container(
                                            width: MySize.safeWidth * 0.4,
                                            margin: EdgeInsets.only(
                                                left: MySize.size16),
                                            decoration: BoxDecoration(
                                              color: themeData.backgroundColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      MySize.size12)),
                                            ),
                                            padding: EdgeInsets.only(
                                                top: MySize.size16,
                                                bottom: MySize.size16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  MdiIcons.commentTextOutline,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  size: MySize.size24,
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: MySize.size8),
                                                    child: Text(
                                                      Translator.translate(
                                                          "text_review"),
                                                      style:
                                                          AppTheme.getTextStyle(
                                                        themeData.textTheme
                                                            .bodyText1,
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground,
                                                        fontWeight: 600,
                                                        letterSpacing: -0.2,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: themeData.cardTheme.shadowColor
                                          .withAlpha(8),
                                      blurRadius: 3,
                                      offset: Offset(0, -3))
                                ],
                                color: themeData.backgroundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(MySize.size24),
                                    topRight: Radius.circular(MySize.size24))),
                            padding: EdgeInsets.symmetric(
                                vertical: MySize.size32,
                                horizontal: MySize.size24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size8)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: themeData
                                                  .colorScheme.primary
                                                  .withAlpha(40),
                                              blurRadius: 4,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MySize.size8)),
                                          color: themeData.colorScheme.primary,
                                          splashColor: themeData.splashColor,
                                          highlightColor:
                                              themeData.colorScheme.primary,
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
                                                    "\$39.99",
                                                    style:
                                                        AppTheme.getTextStyle(
                                                            themeData.textTheme
                                                                .subtitle1,
                                                            letterSpacing: 0.4,
                                                            fontWeight: 700,
                                                            color: themeData
                                                                .colorScheme
                                                                .onPrimary),
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
                                                    color: themeData.colorScheme
                                                        .primaryVariant,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                MySize.size8))),
                                                child: Text(
                                                  Translator.translate(
                                                      "text_Buy_Now"),
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText1,
                                                      fontWeight: 600,
                                                      color: themeData
                                                          .colorScheme
                                                          .onPrimary),
                                                ),
                                              )
                                            ],
                                          ),
                                          padding: EdgeInsets.only(
                                              top: MySize.size12,
                                              bottom: MySize.size12,
                                              right: MySize.size16),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: MySize.size24),
                                      padding: EdgeInsets.fromLTRB(
                                          MySize.size32,
                                          MySize.size16,
                                          MySize.size32,
                                          MySize.size16),
                                      decoration: BoxDecoration(
                                          color: customAppTheme.bgLayer3,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(MySize.size8))),
                                      child: Icon(
                                        MdiIcons.shoppingOutline,
                                        size: MySize.size26,
                                        color: themeData.colorScheme.primary,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ));
      },
    );
  }

  void _selectSizeSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Container(
                decoration: BoxDecoration(
                    color: themeData.backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0))),
                padding: EdgeInsets.symmetric(
                    vertical: MySize.size32, horizontal: MySize.size24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Center(
                                child: Text(
                          "Select a Size",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              fontWeight: 700),
                        ))),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              padding: EdgeInsets.all(MySize.size8),
                              decoration: BoxDecoration(
                                  color: themeData.colorScheme.background,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size16))),
                              child: Icon(
                                MdiIcons.close,
                                size: 16,
                                color: themeData.colorScheme.onBackground,
                              )),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 4;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 4,
                              isSelected: selectedSize == 4,
                            ),
                          ),
                          SingleSizeWidget(
                            size: 5,
                            isAvailable: false,
                            isSelected: selectedSize == 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 6;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 6,
                              isSelected: selectedSize == 6,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 7;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 7,
                              isSelected: selectedSize == 7,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 8;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 8,
                              isSelected: selectedSize == 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SingleSizeWidget(
                            size: 9,
                            isAvailable: false,
                            isSelected: selectedSize == 9,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 11;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 11,
                              isSelected: selectedSize == 11,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 12;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 12,
                              isSelected: selectedSize == 12,
                            ),
                          ),
                          SingleSizeWidget(
                            size: 13,
                            isAvailable: false,
                            isSelected: selectedSize == 13,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = 14;
                              });
                            },
                            child: SingleSizeWidget(
                              size: 14,
                              isSelected: selectedSize == 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 64),
                      child: IntrinsicHeight(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: themeData.colorScheme.primary,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          MdiIcons.imageSizeSelectSmall,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: MySize.size8),
                                        child: Text(
                                          "Size Guide",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              fontWeight: 600,
                                              letterSpacing: 0),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              thickness: 0.8,
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      width: 52,
                                      height: 52,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: themeData.colorScheme.primary,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          MdiIcons.emoticonSadOutline,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Text(
                                          "Can't Find?",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              fontWeight: 600,
                                              letterSpacing: 0),
                                        ))
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
            },
          );
        });
  }
}

class SingleSizeWidget extends StatefulWidget {
  final int size;
  final bool isAvailable, isSelected;

  const SingleSizeWidget(
      {Key key,
      @required this.size,
      this.isAvailable = true,
      this.isSelected = false})
      : super(key: key);

  @override
  _SingleSizeWidgetState createState() => _SingleSizeWidgetState();
}

class _SingleSizeWidgetState extends State<SingleSizeWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Container(
      width: MySize.getScaledSizeHeight(52),
      height: MySize.getScaledSizeHeight(52),
      decoration: BoxDecoration(
        border: Border.all(
            color: (widget.isAvailable && widget.isSelected)
                ? themeData.colorScheme.primary
                : themeData.colorScheme.background,
            width: 1.6),
        shape: BoxShape.circle,
        color: widget.isAvailable
            ? (widget.isSelected
                ? themeData.colorScheme.primary
                : Colors.transparent)
            : themeData.colorScheme.background,
      ),
      child: Center(
        child: Text(
          widget.size.toString(),
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
              letterSpacing: -0.2,
              fontWeight: 600,
              color: (widget.isAvailable && widget.isSelected)
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }
}
