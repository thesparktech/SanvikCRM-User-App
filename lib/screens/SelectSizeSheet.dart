import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class SelectSizeSheet extends StatefulWidget {
  @override
  _SelectSizeSheetState createState() => _SelectSizeSheetState();
}

class _SelectSizeSheetState extends State<SelectSizeSheet> {
  ThemeData themeData;

  int selectedSize = 2, quantity = 2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((context) => _selectSizeSheet(context));
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
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
                  title: Text(Translator.translate("text_Select_Size"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: InkWell(
                  onTap: () {
                    _selectSizeSheet(context);
                  },
                  child: Center(
                    child: Text(Translator.translate("text_click_me")),
                  ),
                )));
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
                        topLeft: Radius.circular(MySize.size16),
                        topRight: Radius.circular(MySize.size16))),
                padding: EdgeInsets.symmetric(
                    vertical: MySize.size24, horizontal: MySize.size16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          Translator.translate("text_size"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.subtitle1,
                              fontWeight: 700),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: MySize.size16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSize = 0;
                                    });
                                  },
                                  child: SingleSizeWidget(
                                      size: "XS",
                                      isSelected: selectedSize == 0),
                                )),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSize = 1;
                                      });
                                    },
                                    child: SingleSizeWidget(
                                        size: "S",
                                        isSelected: selectedSize == 1),
                                  ),
                                ),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSize = 2;
                                      });
                                    },
                                    child: SingleSizeWidget(
                                        size: "M",
                                        isSelected: selectedSize == 2),
                                  ),
                                ),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSize = 3;
                                      });
                                    },
                                    child: SingleSizeWidget(
                                        size: "L",
                                        isSelected: selectedSize == 3),
                                  ),
                                ),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedSize = 4;
                                      });
                                    },
                                    child: SingleSizeWidget(
                                        size: "XL",
                                        isSelected: selectedSize == 4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24),
                      child: Row(
                        children: <Widget>[
                          Text(
                            Translator.translate("text_QTY"),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 700),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: MySize.size20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: themeData.colorScheme.background,
                                  width: 1.2),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size16)),
                              color: Colors.transparent,
                            ),
                            child: IntrinsicHeight(
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: MySize.size8, bottom: MySize.size8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        if (quantity > 1) {
                                          setState(() {
                                            quantity--;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: MySize.size4,
                                            bottom: MySize.size4,
                                            left: MySize.size16,
                                            right: MySize.size16),
                                        child: Icon(
                                          MdiIcons.minus,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          size: MySize.size16,
                                        ),
                                      ),
                                    ),
                                    VerticalDivider(
                                      width: 0,
                                      thickness: 1,
                                      color: themeData.colorScheme.background,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: MySize.size4,
                                          bottom: MySize.size4,
                                          left: MySize.size20,
                                          right: MySize.size20),
                                      child: Text(
                                        quantity.toString(),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 700,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                    VerticalDivider(
                                      width: 0,
                                      thickness: 1,
                                      color: themeData.colorScheme.background,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: MySize.size4,
                                            bottom: MySize.size4,
                                            left: MySize.size16,
                                            right: MySize.size16),
                                        child: Icon(
                                          MdiIcons.plus,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          size: MySize.size16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            Translator.translate("text_total") +
                                " \$" +
                                (quantity * 10).toString(),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline6,
                                fontWeight: 800,
                                color: themeData.colorScheme.onBackground),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size4)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.colorScheme.primary
                                      .withAlpha(40),
                                  blurRadius: 4,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(MySize.size4)),
                              color: themeData.colorScheme.primary,
                              splashColor: themeData.splashColor,
                              highlightColor: themeData.colorScheme.primary,
                              onPressed: () {},
                              child: Text(
                                Translator.translate("text_buy_now")
                                    .toUpperCase(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    letterSpacing: 0.5,
                                    fontWeight: 700,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              padding: EdgeInsets.only(
                                  top: MySize.size12,
                                  bottom: MySize.size12,
                                  left: MySize.size24,
                                  right: MySize.size24),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}

class SingleSizeWidget extends StatefulWidget {
  final String size;
  final bool isSelected;

  const SingleSizeWidget(
      {Key key, @required this.size, @required this.isSelected})
      : super(key: key);

  @override
  _SingleSizeWidgetState createState() => _SingleSizeWidgetState();
}

class _SingleSizeWidgetState extends State<SingleSizeWidget> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      width: MySize.size44,
      height: MySize.size44,
      decoration: BoxDecoration(
          border: widget.isSelected
              ? Border.all(color: Colors.transparent, width: 0)
              : Border.all(color: themeData.colorScheme.background, width: 1.6),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
          color: widget.isSelected
              ? themeData.colorScheme.primary
              : Colors.transparent,
          boxShadow: widget.isSelected
              ? [
                  BoxShadow(
                      color: themeData.colorScheme.primary.withAlpha(40),
                      spreadRadius: 8,
                      blurRadius: 12,
                      offset: Offset(0, 4))
                ]
              : []),
      child: Center(
        child: Text(
          widget.size.toString(),
          style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
              letterSpacing: -0.2,
              fontWeight: 700,
              color: widget.isSelected
                  ? themeData.colorScheme.onPrimary
                  : themeData.colorScheme.onBackground),
        ),
      ),
    );
  }
}
