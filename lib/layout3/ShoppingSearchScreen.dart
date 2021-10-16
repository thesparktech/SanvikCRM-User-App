import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import '../app_localizations.dart';
import 'ShoppingProductScreen.dart';

class ShoppingSearchScreen extends StatefulWidget {
  final BuildContext rootContext;

  const ShoppingSearchScreen({Key key, @required this.rootContext})
      : super(key: key);

  @override
  _ShoppingSearchScreenState createState() => _ShoppingSearchScreenState();
}

class _ShoppingSearchScreenState extends State<ShoppingSearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ThemeData themeData;

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - MySize.size24) / ((width / 2 - MySize.size24) + 72);
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
            home: Scaffold(
                resizeToAvoidBottomInset: false,
                key: _scaffoldKey,
                backgroundColor: themeData.backgroundColor,
                endDrawer: _EndDrawer(
                  scaffoldKey: _scaffoldKey,
                ),
                body: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(
                            right: MySize.size16, left: MySize.size16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    letterSpacing: 0,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  hintText: Translator.translate("text_search"),
                                  hintStyle: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      letterSpacing: 0,
                                      fontWeight: 500),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size16),
                                      ),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size16),
                                      ),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(MySize.size16),
                                      ),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: themeData.colorScheme.background,
                                  prefixIcon: Icon(
                                    MdiIcons.magnify,
                                    size: MySize.size22,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(150),
                                  ),
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.only(right: MySize.size16),
                                ),
                                textCapitalization:
                                    TextCapitalization.sentences,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext buildContext) {
                                      return SortBottomSheet();
                                    });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: MySize.size16),
                                decoration: BoxDecoration(
                                  color: themeData.backgroundColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size16)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeData.cardTheme.shadowColor
                                          .withAlpha(48),
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(MySize.size12),
                                child: Icon(
                                  MdiIcons.swapVertical,
                                  color: themeData.colorScheme.primary,
                                  size: 22,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _scaffoldKey.currentState.openEndDrawer();
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: MySize.size16),
                                decoration: BoxDecoration(
                                  color: themeData.backgroundColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MySize.size16)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: themeData.cardTheme.shadowColor
                                          .withAlpha(48),
                                      blurRadius: 3,
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(MySize.size12),
                                child: Icon(
                                  MdiIcons.tune,
                                  color: themeData.colorScheme.primary,
                                  size: MySize.size22,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.only(
                          left: MySize.size16, top: MySize.size16),
                      child: Text(
                          Translator.translate("text_result_for") +
                              "\"Cosmetics\"",
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600)),
                    ),
                    Container(
                      child: GridView.count(
                          padding: EdgeInsets.all(MySize.size16),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: findAspectRatio(
                              MediaQuery.of(context).size.width),
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          children: <Widget>[
                            _ProductListWidget(
                              name: "Yellow cake",
                              image: './assets/product/product-1.jpg',
                              star: 4,
                              price: 159,
                              rootContext: widget.rootContext,
                            ),
                            _ProductListWidget(
                              name: "Cosmic bang",
                              image: './assets/product/product-7.jpg',
                              star: 4.5,
                              price: 129,
                              rootContext: widget.rootContext,
                            ),
                            _ProductListWidget(
                              name: "Sweet Gems",
                              image: './assets/product/product-5.jpg',
                              star: 3,
                              price: 149,
                              rootContext: widget.rootContext,
                            ),
                            _ProductListWidget(
                              name: "Lipsticks",
                              image: './assets/product/product-3.jpg',
                              star: 4,
                              price: 148,
                              rootContext: widget.rootContext,
                            ),
                            _ProductListWidget(
                              name: "Colorful sandal",
                              image: './assets/product/product-8.jpg',
                              star: 3.8,
                              price: 147,
                              rootContext: widget.rootContext,
                            ),
                            _ProductListWidget(
                              name: "Toffees",
                              image: './assets/product/product-2.jpg',
                              star: 5,
                              price: 120,
                              rootContext: widget.rootContext,
                            ),
                          ]),
                    ),
                  ],
                )));
      },
    );
  }
}

class SortBottomSheet extends StatefulWidget {
  @override
  _SortBottomSheetState createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: themeData.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(MySize.size16),
                topRight: Radius.circular(MySize.size16))),
        child: Padding(
          padding: EdgeInsets.only(
              top: MySize.size16,
              left: MySize.size24,
              right: MySize.size24,
              bottom: MySize.size16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MySize.size8),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 0;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 0;
                              });
                            },
                            groupValue: _radioValue,
                            value: 0,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text(Translator.translate("text_price") + " - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 600)),
                          Text(Translator.translate("text_high_to_low"),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 1;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 1;
                              });
                            },
                            groupValue: _radioValue,
                            value: 1,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text(Translator.translate("text_price") + " - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 600)),
                          Text(Translator.translate("text_low_to_high"),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 2;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 2;
                              });
                            },
                            groupValue: _radioValue,
                            value: 2,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text(Translator.translate("text_name") + " - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 600)),
                          Text(Translator.translate("text_a_to_z"),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _radioValue = 3;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Radio(
                            onChanged: (value) {
                              setState(() {
                                _radioValue = 3;
                              });
                            },
                            groupValue: _radioValue,
                            value: 3,
                            visualDensity: VisualDensity.compact,
                            activeColor: themeData.colorScheme.primary,
                          ),
                          Text(Translator.translate("text_name") + " - ",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 600)),
                          Text(Translator.translate("text_z_to_a"),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 500)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductListWidget extends StatefulWidget {
  final String name, image;
  final double star;
  final int price;
  final BuildContext rootContext;

  const _ProductListWidget(
      {Key key,
      @required this.name,
      @required this.image,
      @required this.star,
      @required this.price,
      @required this.rootContext})
      : super(key: key);

  @override
  __ProductListWidgetState createState() => __ProductListWidgetState();
}

class __ProductListWidgetState extends State<_ProductListWidget> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    String key = Generator.randomString(10);
    themeData = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            widget.rootContext,
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
              color: themeData.cardTheme.shadowColor.withAlpha(16),
              blurRadius: 8,
              spreadRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: key,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size8)),
                    child: Image.asset(
                      widget.image,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(
                      MdiIcons.heartOutline,
                      color: themeData.colorScheme.onBackground.withAlpha(160),
                      size: 20,
                    ))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: MySize.size8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(widget.name,
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText1,
                          fontWeight: 700,
                          letterSpacing: 0)),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Generator.buildRatingStar(
                            rating: widget.star,
                            size: 16,
                            activeColor: Color(0xffffd208),
                            inactiveColor: themeData.colorScheme.onBackground),
                        Container(
                          margin: EdgeInsets.only(left: MySize.size4),
                          child: Text(widget.star.toString(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  fontWeight: 700)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: MySize.size2),
                    child: Text(
                      "\$ " + widget.price.toString(),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          fontWeight: 800,
                          letterSpacing: 0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EndDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _EndDrawer({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  __EndDrawerState createState() => __EndDrawerState();
}

class __EndDrawerState extends State<_EndDrawer> {
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: themeData.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: MySize.size8),
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  Translator.translate("text_filter").toUpperCase(),
                  style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                      fontWeight: 800, color: themeData.colorScheme.primary),
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      left: MySize.size16,
                      right: MySize.size16,
                      top: MySize.size24),
                  child: _CategoryDrawerWidget()),
              Container(
                padding: EdgeInsets.only(
                    left: MySize.size16,
                    right: MySize.size16,
                    top: MySize.size16),
                child: Text(
                  Translator.translate("text_rating"),
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      fontWeight: 700, letterSpacing: 0),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(
                      left: MySize.size16,
                      right: MySize.size16,
                      top: MySize.size8),
                  child: _RatingDrawerWidget()),
              Container(
                padding: EdgeInsets.only(
                    left: MySize.size16,
                    right: MySize.size16,
                    top: MySize.size16),
                child: Text(
                  Translator.translate("text_price_range"),
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      fontWeight: 700, letterSpacing: 0),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: MySize.size16, right: MySize.size16),
                child: _PriceRangeDrawerWidget(),
              ),
              Container(
                margin: EdgeInsets.all(MySize.size24),
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(MySize.size4)),
                    boxShadow: [
                      BoxShadow(
                        color: themeData.colorScheme.primary.withAlpha(24),
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(MySize.size8)),
                    color: themeData.colorScheme.primary,
                    splashColor: Colors.white.withAlpha(40),
                    highlightColor: themeData.colorScheme.primary,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      Translator.translate("text_apply"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          fontWeight: 700,
                          color: themeData.colorScheme.onPrimary,
                          letterSpacing: 0.3),
                    ),
                    padding: EdgeInsets.only(
                        top: MySize.size12, bottom: MySize.size12),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _CategoryDrawerWidget extends StatefulWidget {
  final List<String> reportList = [
    Translator.translate("text_man"),
    Translator.translate("text_woman"),
    Translator.translate("text_sale"),
    Translator.translate("text_food"),
    Translator.translate("text_other"),
  ];

  @override
  _CategoryDrawerWidgetState createState() => _CategoryDrawerWidgetState();
}

class _CategoryDrawerWidgetState extends State<_CategoryDrawerWidget> {
  List<String> selectedChoices = [
    Translator.translate("text_woman"),
    Translator.translate("text_food"),
  ];

  ThemeData themeData;

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: EdgeInsets.all(MySize.size6),
        child: ChoiceChip(
          backgroundColor: themeData.colorScheme.background,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: themeData.colorScheme.primary,
          label: Text(item,
              style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                  color: selectedChoices.contains(item)
                      ? themeData.colorScheme.onSecondary
                      : themeData.colorScheme.onBackground,
                  fontWeight: selectedChoices.contains(item) ? 700 : 600)),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}

class _RatingDrawerWidget extends StatefulWidget {
  @override
  _RatingDrawerWidgetState createState() => _RatingDrawerWidgetState();
}

class _RatingDrawerWidgetState extends State<_RatingDrawerWidget> {
  List<bool> _star = [false, true, true, true, true];

  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: _star.length,
        reverse: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                _star[index] = !_star[index];
              });
            },
            child: Row(
              children: <Widget>[
                Checkbox(
                  visualDensity: VisualDensity.compact,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: _star[index],
                  activeColor: themeData.colorScheme.primary,
                  onChanged: (bool value) {
                    setState(() {
                      _star[index] = value;
                    });
                  },
                ),
                Container(
                    margin: EdgeInsets.only(left: MySize.size4),
                    child: Generator.buildRatingStar(
                        rating: (index + 1).toDouble(),
                        inactiveColor: themeData.colorScheme.onBackground))
              ],
            ),
          );
        });
  }
}

class _PriceRangeDrawerWidget extends StatefulWidget {
  @override
  _PriceRangeDrawerWidgetState createState() => _PriceRangeDrawerWidgetState();
}

class _PriceRangeDrawerWidgetState extends State<_PriceRangeDrawerWidget> {
  double _starValue = 10;
  double _endValue = 80;
  double _multiFactor = 1500;
  ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Column(
      children: <Widget>[
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 3,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
          ),
          child: RangeSlider(
            values: RangeValues(_starValue, _endValue),
            min: 0.0,
            max: 100.0,
            onChanged: (values) {
              setState(() {
                _starValue = values.start.roundToDouble();
                _endValue = values.end.roundToDouble();
              });
            },
          ),
        ),
        Text(
          (_starValue * _multiFactor).floor().toString() +
              " - " +
              (_endValue * _multiFactor).floor().toString(),
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
              fontWeight: 600),
        )
      ],
    );
  }
}
