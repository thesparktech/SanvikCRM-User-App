import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import '../app_localizations.dart';

class ShoppingOrderStatusScreen extends StatefulWidget {
  @override
  _ShoppingOrderStatusScreenState createState() =>
      _ShoppingOrderStatusScreenState();
}

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class _ShoppingOrderStatusScreenState extends State<ShoppingOrderStatusScreen> {
  int _currentStep = 3;

  ThemeData themeData;

  List<TextIconItem> _textIconChoice = [
    TextIconItem(Translator.translate("text_receipt"), MdiIcons.receipt),
    TextIconItem(Translator.translate("text_cancel"), MdiIcons.cancel)
  ];

  void initState() {
    super.initState();
  }

  dispose() {
    super.dispose();
  }

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
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      height: MySize.getScaledSizeHeight(200),
                      child: PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        controller: PageController(
                          initialPage: 0,
                          viewportFraction: 0.80,
                        ),
                        onPageChanged: (int page) {
                          setState(() {});
                        },
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                                bottom: MySize.size8,
                                right: MySize.size12,
                                top: MySize.size8),
                            decoration: BoxDecoration(
                              color: themeData.cardTheme.color,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size16)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.cardTheme.shadowColor
                                      .withAlpha(28),
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(left: MySize.size16),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: MySize.size8,
                                  top: MySize.size16,
                                  bottom: MySize.size16,
                                  right: MySize.size8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            Translator.translate("text_order") +
                                                " " +
                                                Translator.translate(
                                                    "text_no") +
                                                ": 381478",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle1,
                                                fontWeight: 700),
                                          ),
                                          Text(
                                            Translator.translate(
                                                    "text_placed_on") +
                                                " april, 14,2020",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 300),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: PopupMenuButton(
                                          itemBuilder: (BuildContext context) {
                                            return _textIconChoice
                                                .map((TextIconItem choice) {
                                              return PopupMenuItem(
                                                value: choice,
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(choice.iconData,
                                                        size: MySize.size18,
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: MySize.size8),
                                                      child: Text(choice.text,
                                                          style: AppTheme
                                                              .getTextStyle(
                                                                  themeData
                                                                      .textTheme
                                                                      .bodyText2)),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList();
                                          },
                                          icon: Icon(
                                            MdiIcons.dotsVertical,
                                            color: themeData
                                                .colorScheme.onBackground,
                                          ),
                                          color: themeData.backgroundColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(Translator.translate("text_paid"),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 700)),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          Translator.translate("text_status") +
                                              " : ",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              fontWeight: 600)),
                                      Text(
                                          Translator.translate(
                                              "text_on_the_way"),
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle1,
                                              fontWeight: 700)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: MySize.size8,
                                right: MySize.size12,
                                left: MySize.size12,
                                top: MySize.size8),
                            decoration: BoxDecoration(
                              color: themeData.cardTheme.color,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size16)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.cardTheme.shadowColor
                                      .withAlpha(28),
                                  blurRadius: 5,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(left: MySize.size16),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: MySize.size8,
                                  top: MySize.size16,
                                  bottom: MySize.size16,
                                  right: MySize.size8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            Translator.translate("text_order") +
                                                " " +
                                                Translator.translate(
                                                    "text_no") +
                                                ": 47856521",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.subtitle1,
                                                fontWeight: 700),
                                          ),
                                          Text(
                                            Translator.translate(
                                                    "text_placed_on") +
                                                " feb, 14,2020",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 400),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: PopupMenuButton(
                                          itemBuilder: (BuildContext context) {
                                            return _textIconChoice
                                                .map((TextIconItem choice) {
                                              return PopupMenuItem(
                                                value: choice,
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(choice.iconData,
                                                        size: MySize.size18,
                                                        color: themeData
                                                            .colorScheme
                                                            .onBackground),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: MySize.size8),
                                                      child: Text(choice.text,
                                                          style: AppTheme
                                                              .getTextStyle(
                                                                  themeData
                                                                      .textTheme
                                                                      .bodyText2)),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList();
                                          },
                                          icon: Icon(
                                            MdiIcons.dotsVertical,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            size: MySize.size24,
                                          ),
                                          color: themeData.backgroundColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                      Translator.translate(
                                          "text_cash_on_delivery"),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          fontWeight: 700)),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          Translator.translate("text_status") +
                                              " : ",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle2,
                                              fontWeight: 600)),
                                      Text(
                                          Translator.translate(
                                              "text_delivered"),
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.subtitle1,
                                              fontWeight: 700)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: MySize.size8,
                                bottom: MySize.size8,
                                left: MySize.size12),
                            decoration: BoxDecoration(
                              color: themeData.cardTheme.color,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(MySize.size16)),
                              boxShadow: [
                                BoxShadow(
                                  color: themeData.cardTheme.shadowColor
                                      .withAlpha(28),
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                  Translator.translate("text_view_all")
                                      .toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle1,
                                      fontWeight: 700,
                                      letterSpacing: 0.5,
                                      color: themeData.colorScheme.onBackground
                                          .withAlpha(200))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MySize.size24,
                          left: MySize.size16,
                          right: MySize.size16),
                      child: Text(
                        Translator.translate("text_status").toUpperCase(),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            fontWeight: 800,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(200)),
                      ),
                    ),
                    Container(
                      child: Stepper(
                        physics: ClampingScrollPhysics(),
                        controlsBuilder: (BuildContext context,
                            {VoidCallback onStepContinue,
                            VoidCallback onStepCancel}) {
                          return Container();
                        },
                        currentStep: _currentStep,
                        onStepTapped: (pos) {
                          setState(() {
                            _currentStep = pos;
                          });
                        },
                        steps: <Step>[
                          Step(
                            isActive: true,
                            state: StepState.complete,
                            title: Text(
                                Translator.translate("text_order_placed") +
                                    ' - 14 April',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600)),
                            content: Text(
                                Translator.translate(
                                    "text_order_was_received_by_seller"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle2,
                                    fontWeight: 500)),
                          ),
                          Step(
                            isActive: true,
                            state: StepState.complete,
                            title: Text(
                                Translator.translate("text_payment_confirmed") +
                                    ' - 14 april',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600)),
                            content: SizedBox(
                              child: Text(
                                  Translator.translate("text_pay_via") +
                                      " debit card",
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500)),
                            ),
                          ),
                          Step(
                            isActive: true,
                            state: StepState.complete,
                            title: Text(
                                Translator.translate("text_processing") +
                                    ' - 16 April',
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600)),
                            content: SizedBox(
                              child: Text(
                                  Translator.translate(
                                      "text_it_may_be_take_longer_time_than_expected"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500)),
                            ),
                          ),
                          Step(
                            isActive: true,
                            state: StepState.indexed,
                            title: Text(Translator.translate("text_on_the_way"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600)),
                            content: SizedBox(
                              child: Text(
                                  "Jenifer " +
                                      Translator.translate(
                                          "text_picked_your_order") +
                                      ", " +
                                      Translator.translate(
                                          "text_you_can_contact_her_anytime"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500)),
                            ),
                          ),
                          Step(
                            state: StepState.indexed,
                            title: Text(Translator.translate("text_deliver"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 600)),
                            content: SizedBox(
                              child: Text(
                                  Translator.translate("text_today_at") +
                                      " 2:30 PM " +
                                      Translator.translate(
                                          "text_order_has_been_deliver"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      fontWeight: 500)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}
