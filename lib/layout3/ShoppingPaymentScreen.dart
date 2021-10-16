import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';
import 'ShoppingRatingScreen.dart';

class ShoppingPaymentScreen extends StatefulWidget {
  @override
  _ShoppingPaymentScreenState createState() => _ShoppingPaymentScreenState();
}

class _ShoppingPaymentScreenState extends State<ShoppingPaymentScreen> {
  final int _numPages = 3;
  int _currentPage = 0;
  ThemeData themeData;

  int _selectedMethod = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: MySize.size4),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive
            ? themeData.colorScheme.primary
            : themeData.colorScheme.onBackground.withAlpha(120),
        borderRadius: BorderRadius.all(Radius.circular(MySize.size4)),
      ),
    );
  }

  void initState() {
    super.initState();
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
                  title: Text(Translator.translate("text_payment"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: ListView(
                  padding: EdgeInsets.all(0),
                  children: <Widget>[
                    Container(
                      height: MySize.getScaledSizeHeight(240),
                      decoration: BoxDecoration(
                          color: themeData.backgroundColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(MySize.size16),
                              topRight: Radius.circular(MySize.size16))),
                      child: PageView(
                        pageSnapping: true,
                        physics: ClampingScrollPhysics(),
                        controller: PageController(
                            initialPage: 1,
                            viewportFraction: 0.85,
                            keepPage: false),
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: MySize.size8,
                                bottom: MySize.size24,
                                right: MySize.size8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: themeData.colorScheme.secondary,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size16)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.secondary
                                        .withAlpha(30),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.only(left: MySize.size24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Visa",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline5,
                                          fontWeight: 700,
                                          color: themeData
                                              .colorScheme.onSecondary)),
                                  Text("3481 4866 4789 9954",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          fontWeight: 600,
                                          color: themeData
                                              .colorScheme.onSecondary)),
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              Translator.translate(
                                                  "text_card_holder"),
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  color: themeData
                                                      .colorScheme.onSecondary,
                                                  fontWeight: 500)),
                                          Text("Natalia dyer",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.onSecondary,
                                                  fontWeight: 600)),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MySize.size24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                                Translator.translate(
                                                    "text_expired_date"),
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2,
                                                    color: themeData.colorScheme
                                                        .onSecondary,
                                                    fontWeight: 500)),
                                            Text("08/26",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText1,
                                                    color: themeData.colorScheme
                                                        .onSecondary,
                                                    fontWeight: 600)),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MySize.size8,
                                bottom: MySize.size24,
                                left: MySize.size8,
                                right: MySize.size8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: themeData.colorScheme.primary,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size16)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(30),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.only(left: MySize.size24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text("Mastercard",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline5,
                                          fontWeight: 700,
                                          color: themeData
                                              .colorScheme.onSecondary)),
                                  Text("4879 5846 5478 2363",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle1,
                                          fontWeight: 600,
                                          color: themeData
                                              .colorScheme.onSecondary)),
                                  Row(
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              Translator.translate(
                                                  "text_card_holder"),
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText2,
                                                  color: themeData
                                                      .colorScheme.onSecondary,
                                                  fontWeight: 500)),
                                          Text("Liana Fitzgeraldl",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  color: themeData
                                                      .colorScheme.onSecondary,
                                                  fontWeight: 600)),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: MySize.size24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                                Translator.translate(
                                                    "text_expired_date"),
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText2,
                                                    color: themeData.colorScheme
                                                        .onSecondary,
                                                    fontWeight: 500)),
                                            Text("04/25",
                                                style: AppTheme.getTextStyle(
                                                    themeData
                                                        .textTheme.bodyText1,
                                                    color: themeData.colorScheme
                                                        .onSecondary,
                                                    fontWeight: 600)),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MySize.size8,
                                bottom: MySize.size24,
                                left: MySize.size8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: themeData.colorScheme.secondary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.secondary
                                        .withAlpha(30),
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.only(left: MySize.size24),
                              child: Center(
                                child: Text(
                                    Translator.translate("text_add_card"),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle1,
                                        fontWeight: 600,
                                        letterSpacing: 0.5,
                                        color:
                                            themeData.colorScheme.onPrimary)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(MySize.size16),
                              child: Text(
                                  Translator.translate("text_methods")
                                      .toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 700,
                                      color: themeData.colorScheme.onBackground,
                                      muted: true))),
                          Divider(
                            color: themeData.dividerColor,
                            thickness: 0.3,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: MySize.size16,
                                right: MySize.size16,
                                top: MySize.size8,
                                bottom: MySize.size8),
                            child: Row(
                              children: <Widget>[
                                Image(
                                  image:
                                      AssetImage('./assets/brand/google.png'),
                                  width: MySize.size30,
                                  height: MySize.size30,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: MySize.size16),
                                    child: Text(
                                        Translator.translate("text_g_pay"),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            fontWeight: 600)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: themeData.dividerColor,
                            thickness: 0.3,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: MySize.size16,
                                right: MySize.size16,
                                top: MySize.size8,
                                bottom: MySize.size8),
                            child: Row(
                              children: <Widget>[
                                Image(
                                    image:
                                        AssetImage('./assets/brand/paypal.png'),
                                    width: MySize.size30,
                                    height: MySize.size30),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: MySize.size16),
                                    child: Text(
                                        Translator.translate("text_paypal"),
                                        style: AppTheme.getTextStyle(
                                            themeData.textTheme.subtitle1,
                                            fontWeight: 600)),
                                  ),
                                ),
                                Icon(
                                  MdiIcons.check,
                                  color: themeData.colorScheme.onBackground,
                                  size: MySize.size24,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: themeData.dividerColor,
                            thickness: 0.3,
                          ),
                          Container(
                              padding: EdgeInsets.all(MySize.size16),
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: Text(
                                  Translator.translate("text_other")
                                      .toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 700,
                                      color: themeData.colorScheme.onBackground,
                                      muted: true))),
                          Container(
                            margin: EdgeInsets.only(
                                left: MySize.size16, right: MySize.size16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedMethod = 0;
                                    });
                                  },
                                  child: OptionWidget(
                                    iconData: MdiIcons.history,
                                    text: Translator.translate("text_on_emi"),
                                    isSelected: _selectedMethod == 0,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedMethod = 1;
                                    });
                                  },
                                  child: OptionWidget(
                                    iconData: MdiIcons.bankOutline,
                                    text: Translator.translate("text_bank"),
                                    isSelected: _selectedMethod == 1,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedMethod = 2;
                                    });
                                  },
                                  child: OptionWidget(
                                    iconData: MdiIcons.cashMarker,
                                    text: Translator.translate("text_COD"),
                                    isSelected: _selectedMethod == 2,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MySize.size32),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8)),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    themeData.colorScheme.primary.withAlpha(28),
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(MySize.size8)),
                            color: themeData.colorScheme.primary,
                            splashColor:
                                themeData.colorScheme.onPrimary.withAlpha(100),
                            highlightColor: themeData.colorScheme.primary,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingRatingScreen()));
                            },
                            child: Text(
                                Translator.translate("text_pay_with_secure")
                                    .toUpperCase(),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary,
                                    letterSpacing: 0.3)),
                            padding: EdgeInsets.only(
                                top: MySize.size12, bottom: MySize.size12),
                          ),
                        ),
                      ),
                    ),
                  ],
                )));
      },
    );
  }
}

class OptionWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool isSelected;

  OptionWidget(
      {Key key,
      @required this.iconData,
      @required this.text,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? themeData.colorScheme.primary
            : themeData.cardTheme.color,
        borderRadius: BorderRadius.all(Radius.circular(MySize.size8)),
        boxShadow: [
          BoxShadow(
            color: themeData.cardTheme.shadowColor.withAlpha(24),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(MySize.size16),
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: isSelected
                ? themeData.colorScheme.onPrimary
                : themeData.colorScheme.onBackground,
            size: MySize.size30,
          ),
          Container(
            margin: EdgeInsets.only(top: MySize.size8),
            child: Text(
              text,
              style: AppTheme.getTextStyle(
                themeData.textTheme.caption,
                fontWeight: 700,
                color: isSelected
                    ? themeData.colorScheme.onPrimary
                    : themeData.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
    );
  }
}
