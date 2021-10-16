import 'dart:math';
import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/CardMonthInputFormatter.dart';
import 'package:SanvikSystem/utils/CardNumberInputFormatter.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class AddCardScreen extends StatefulWidget {
  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen>
    with SingleTickerProviderStateMixin {
  ThemeData themeData;

  AnimationController _controller;
  bool _flag = true;

  bool isFront = true;

  //Credit card
  String creditCardNumber = "4040 4040 4040 4040";
  String creditCardDate = "MM/YY";
  String creditCardName = "Holder Name";
  String creditCardCVV = "739";
  Color creditCardColor = const Color(0xff334382);
  TextEditingController cardNumberTextEditingController,
      cardDateTextEditingController,
      cardNameTextEditingController,
      cardCVVTextEditingController;

  //Focus node
  FocusNode creditNumberFocusNode,
      creditDateFocusNode,
      creditNameFocusNode,
      creditCVVFocusNode;

  flip({bool goFront = false, bool goBack = false}) async {
    if (goFront && isFront) {
      return;
    }
    if (goBack && !isFront) {
      return;
    }
    await _controller.reverse();
    setState(() {
      isFront = !isFront;
    });
    await _controller.forward();
  }

  initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 600), value: 1);

    cardNumberTextEditingController = TextEditingController();
    cardDateTextEditingController = TextEditingController();
    cardNameTextEditingController = TextEditingController();
    cardCVVTextEditingController = TextEditingController();

    creditNumberFocusNode = FocusNode();
    creditDateFocusNode = FocusNode();
    creditNameFocusNode = FocusNode();
    creditCVVFocusNode = FocusNode();

    cardNumberTextEditingController.addListener(() {
      setState(() {
        creditCardNumber = cardNumberTextEditingController.text;
      });
    });

    cardDateTextEditingController.addListener(() {
      setState(() {
        creditCardDate = cardDateTextEditingController.text;
      });
    });

    cardNameTextEditingController.addListener(() {
      setState(() {
        creditCardName = cardNameTextEditingController.text;
      });
    });

    cardCVVTextEditingController.addListener(() {
      setState(() {
        creditCardCVV = cardCVVTextEditingController.text;
      });
    });

    creditNumberFocusNode.addListener(() {
      flip(goFront: true);
    });
    creditDateFocusNode.addListener(() {
      flip(goFront: true);
    });
    creditNameFocusNode.addListener(() {
      flip(goFront: true);
    });

    creditCVVFocusNode.addListener(() {
      flip(goBack: true);
    });
  }

  dispose() {
    super.dispose();
    cardNumberTextEditingController.dispose();
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
                  title: Text(Translator.translate("text_add_card"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                  actions: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: MySize.size24),
                            child: Icon(MdiIcons.check)))
                  ],
                ),
                backgroundColor: themeData.backgroundColor,
                body: Container(
                  child: Column(
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Transform(
                            transform: Matrix4.rotationY(
                                (1 - _controller.value) * pi / 2),
                            alignment: Alignment.center,
                            child: Container(
                              height: MySize.getScaledSizeHeight(200),
                              child: isFront
                                  ? Container(
                                      height: MySize.getScaledSizeHeight(200),
                                      margin: EdgeInsets.only(
                                          top: MySize.size8,
                                          bottom: MySize.size8,
                                          right: MySize.size24,
                                          left: MySize.size24),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.7,
                                            color:
                                                themeData.colorScheme.surface),
                                        color: creditCardColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: themeData
                                                .cardTheme.shadowColor
                                                .withAlpha(28),
                                            blurRadius: 3,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsets.all(MySize.size24),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: MySize.size4,
                                                  right: MySize.size8,
                                                  bottom: MySize.size4,
                                                  left: MySize.size8),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              MySize.size4))),
                                              child: Text(
                                                "VISA",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.headline6,
                                                    fontWeight: 700,
                                                    color: creditCardColor),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Text(creditCardNumber,
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle1,
                                                    fontWeight: 600,
                                                    letterSpacing: 0.5,
                                                    wordSpacing: 1,
                                                    color: Colors.white)),
                                          ),
                                          Container(
                                            child: Text(creditCardDate,
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle1,
                                                    fontWeight: 600,
                                                    letterSpacing: 0.5,
                                                    wordSpacing: 1,
                                                    color: Colors.white)),
                                          ),
                                          Container(
                                            child: Text(creditCardName,
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.subtitle1,
                                                    fontWeight: 500,
                                                    letterSpacing: 0.3,
                                                    wordSpacing: 1,
                                                    color: Colors.white)),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: MySize.getScaledSizeHeight(200),
                                      margin: EdgeInsets.only(
                                          top: MySize.size8,
                                          bottom: MySize.size8,
                                          right: MySize.size24,
                                          left: MySize.size24),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.7,
                                            color:
                                                themeData.colorScheme.surface),
                                        color: creditCardColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(MySize.size8)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: themeData
                                                .cardTheme.shadowColor
                                                .withAlpha(28),
                                            blurRadius: 3,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: MySize.size24,
                                            bottom: MySize.size24),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              width: MySize.safeWidth,
                                              height: MySize.size36,
                                              color: Colors.black,
                                            ),
                                            Container(
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      height: MySize.size36,
                                                      color: Color(0xffbdc2d8),
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MySize.safeWidth * 0.3,
                                                    height: MySize.size28,
                                                    color: Colors.white,
                                                    padding: EdgeInsets.only(
                                                        left: MySize.size8),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      creditCardCVV,
                                                      style:
                                                          AppTheme.getTextStyle(
                                                              themeData
                                                                  .textTheme
                                                                  .subtitle1,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight: 600,
                                                              letterSpacing:
                                                                  0.5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: MySize.size24),
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    top: MySize.size4,
                                                    right: MySize.size8,
                                                    bottom: MySize.size4,
                                                    left: MySize.size8),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                MySize.size4))),
                                                child: Text(
                                                  "VISA",
                                                  style: AppTheme.getTextStyle(
                                                      themeData
                                                          .textTheme.bodyText1,
                                                      fontWeight: 700,
                                                      color: creditCardColor),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.only(
                              top: MySize.size24,
                              left: MySize.size24,
                              right: MySize.size24),
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText:
                                    Translator.translate("text_card_number"),
                                hintText:
                                    Translator.translate("text_card_number"),
                                border: themeData.inputDecorationTheme.border,
                                enabledBorder:
                                    themeData.inputDecorationTheme.border,
                                focusedBorder: themeData
                                    .inputDecorationTheme.focusedBorder,
                                prefixIcon: Icon(MdiIcons.numeric),
                              ),
                              controller: cardNumberTextEditingController,
                              keyboardType: TextInputType.number,
                              textCapitalization: TextCapitalization.sentences,
                              focusNode: creditNumberFocusNode,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(RegExp(r"[\d]")),
                                LengthLimitingTextInputFormatter(16),
                                CardNumberInputFormatter()
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText:
                                      Translator.translate("text_expired_date"),
                                  hintText:
                                      Translator.translate("text_expired_date"),
                                  border: themeData.inputDecorationTheme.border,
                                  enabledBorder:
                                      themeData.inputDecorationTheme.border,
                                  focusedBorder: themeData
                                      .inputDecorationTheme.focusedBorder,
                                  prefixIcon:
                                      Icon(MdiIcons.calendarRangeOutline),
                                ),
                                controller: cardDateTextEditingController,
                                keyboardType: TextInputType.number,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                focusNode: creditDateFocusNode,
                                inputFormatters: [
                                  CardMonthInputFormatter(),
                                  LengthLimitingTextInputFormatter(5)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText:
                                      Translator.translate("text_card_holder"),
                                  hintText:
                                      Translator.translate("text_card_holder"),
                                  border: themeData.inputDecorationTheme.border,
                                  enabledBorder:
                                      themeData.inputDecorationTheme.border,
                                  focusedBorder: themeData
                                      .inputDecorationTheme.focusedBorder,
                                  prefixIcon: Icon(MdiIcons.accountOutline),
                                ),
                                controller: cardNameTextEditingController,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                focusNode: creditNameFocusNode,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(24),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size24),
                              child: InkWell(
                                onTap: () {
                                  flip(goBack: true);
                                },
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: Translator.translate("text_cvv"),
                                    hintText: Translator.translate("text_cvv"),
                                    border:
                                        themeData.inputDecorationTheme.border,
                                    enabledBorder:
                                        themeData.inputDecorationTheme.border,
                                    focusedBorder: themeData
                                        .inputDecorationTheme.focusedBorder,
                                    prefixIcon:
                                        Icon(MdiIcons.creditCardOutline),
                                  ),
                                  focusNode: creditCVVFocusNode,
                                  controller: cardCVVTextEditingController,
                                  keyboardType: TextInputType.number,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  inputFormatters: [
                                    WhitelistingTextInputFormatter(
                                        RegExp(r"[\d]")),
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                ),
                              ),
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
}
