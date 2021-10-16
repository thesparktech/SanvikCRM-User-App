import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingOrderPlaceScreen extends StatefulWidget {
  @override
  _ShoppingOrderPlaceScreenState createState() =>
      _ShoppingOrderPlaceScreenState();
}

class _ShoppingOrderPlaceScreenState extends State<ShoppingOrderPlaceScreen> {
  ThemeData themeData;

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _ScratchDialog());
  }

  @override
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
                ),
                body: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image(
                            image: AssetImage(
                                './assets/illustration/order-confirm.png'),
                            width: MySize.safeWidth * 0.5,
                            height: MySize.safeWidth * 0.5,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size32),
                          child: Text(
                            Translator.translate(
                                "text_your_order_place_successfully"),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16),
                          child: Text(
                            Translator.translate(
                                "text_you_won_a_scratch_coupon"),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size16),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(MySize.size8)),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    themeData.colorScheme.primary.withAlpha(20),
                                blurRadius: MySize.size2,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(MySize.size4)),
                              color: themeData.colorScheme.primary,
                              splashColor: Colors.white,
                              onPressed: () {
                                _showDialog();
                              },
                              child: Text(
                                Translator.translate("text_scratch"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    fontWeight: 600,
                                    color: themeData.colorScheme.onPrimary),
                              )),
                        ),
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}

class _ScratchDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      insetPadding: EdgeInsets.only(left: MySize.size52, right: MySize.size52),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(MySize.size8))),
      child: Container(
        padding: EdgeInsets.only(
            top: MySize.size24,
            bottom: MySize.size24,
            left: MySize.size40,
            right: MySize.size40),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(MySize.size8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: MySize.size10,
              offset: Offset(0.0, MySize.size10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Text(
                Translator.translate("text_congratulations") + "!",
                style: AppTheme.getTextStyle(themeData.textTheme.headline6,
                    color: themeData.colorScheme.primary,
                    fontWeight: 700,
                    letterSpacing: 0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16),
              child: Text(
                Translator.translate("text_scratch_coupon_dialog_info"),
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 600,
                    height: 1.2,
                    letterSpacing: -0.2),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size32),
              child: Text(
                Translator.translate("SH10USE"),
                style: AppTheme.getTextStyle(
                  themeData.textTheme.headline5,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 800,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size32),
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(MySize.size24)),
                  color: themeData.colorScheme.primary,
                  padding: EdgeInsets.only(
                      left: MySize.size32, right: MySize.size32),
                  splashColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text(Translator.translate("text_redeem_it").toUpperCase(),
                          style: AppTheme.getTextStyle(
                            themeData.textTheme.button,
                            fontSize: 13,
                            fontWeight: 600,
                            color: themeData.colorScheme.onPrimary,
                            letterSpacing: 0.5,
                          ))),
            )
          ],
        ),
      ),
    );
  }
}
