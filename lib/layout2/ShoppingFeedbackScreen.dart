import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingFeedbackScreen extends StatefulWidget {
  @override
  _ShoppingFeedbackScreenState createState() => _ShoppingFeedbackScreenState();
}

class _ShoppingFeedbackScreenState extends State<ShoppingFeedbackScreen> {
  ThemeData themeData;
  int radioValue = 0;
  bool checkDT = true, checkCS = false, checkQ = true, checkOther = false;
  bool checkValue = true;

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
                backgroundColor: themeData.backgroundColor,
                body: Container(
                  child: ListView(
                    padding: EdgeInsets.only(
                        top: MySize.size0, bottom: MySize.size16),
                    children: <Widget>[
                      Container(
                          child: Icon(MdiIcons.emoticonExcitedOutline,
                              color: themeData.colorScheme.primary,
                              size: MySize.size64)),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size8),
                        child: Text(
                          Translator.translate('text_thats_great'),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 600,
                              letterSpacing: 0.2),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: MySize.size0),
                        child: Text(
                          Translator.translate(
                              "text_tell_us_what_we_got_wrong"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText1,
                              letterSpacing: 0,
                              fontWeight: 600,
                              height: 1.2),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: MySize.size48,
                            right: MySize.size48,
                            top: MySize.size32),
                        child: Column(
                          children: <Widget>[
                            Divider(),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    checkDT = !checkDT;
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      onChanged: (value) {
                                        setState(() {
                                          checkDT = value;
                                        });
                                      },
                                      visualDensity: VisualDensity.compact,
                                      value: checkDT,
                                      activeColor:
                                          themeData.colorScheme.primary,
                                    ),
                                    Text(
                                      Translator.translate(
                                          "text_delivery_time"),
                                      style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    checkCS = !checkCS;
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      onChanged: (value) {
                                        setState(() {
                                          checkCS = value;
                                        });
                                      },
                                      visualDensity: VisualDensity.compact,
                                      value: checkCS,
                                      activeColor:
                                          themeData.colorScheme.primary,
                                    ),
                                    Text(
                                      Translator.translate(
                                          "text_customer_service"),
                                      style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    checkQ = !checkQ;
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      onChanged: (value) {
                                        setState(() {
                                          checkQ = value;
                                        });
                                      },
                                      visualDensity: VisualDensity.compact,
                                      value: checkQ,
                                      activeColor:
                                          themeData.colorScheme.primary,
                                    ),
                                    Text(
                                      Translator.translate("text_quality"),
                                      style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Divider(),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    checkOther = !checkOther;
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      onChanged: (value) {
                                        setState(() {
                                          checkOther = value;
                                        });
                                      },
                                      visualDensity: VisualDensity.compact,
                                      value: checkOther,
                                      activeColor:
                                          themeData.colorScheme.primary,
                                    ),
                                    Text(
                                      Translator.translate("text_other"),
                                      style: AppTheme.getTextStyle(
                                        themeData.textTheme.subtitle2,
                                        color:
                                            themeData.colorScheme.onBackground,
                                        fontWeight: 500,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: Translator.translate(
                                          "text_let_us_know_more") +
                                      " ...",
                                  hintStyle: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: themeData.colorScheme.onBackground,
                                      muted: true),
                                  isDense: true,
                                  filled: true,
                                  fillColor: themeData.colorScheme.background,
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                textCapitalization:
                                    TextCapitalization.sentences,
                                minLines: 5,
                                maxLines: 10,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: VisualDensity.compact,
                                    onChanged: (bool value) {
                                      setState(() {
                                        checkValue = value;
                                      });
                                    },
                                    value: checkValue,
                                    activeColor: themeData.colorScheme.primary,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: MySize.size8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          Translator.translate(
                                              "text_allow_us_to_reply"),
                                          style: AppTheme.getTextStyle(
                                            themeData.textTheme.bodyText2,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 600,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                        Text(
                                          Translator.translate(
                                              "text_your_email_will_not_be_revealed"),
                                          style: AppTheme.getTextStyle(
                                            themeData.textTheme.caption,
                                            color: themeData
                                                .colorScheme.onBackground,
                                            fontWeight: 500,
                                            muted: true,
                                            fontSize: 11,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: MySize.size16),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(MySize.size8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: themeData.colorScheme.primary
                                        .withAlpha(28),
                                    blurRadius: 4,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(MySize.size4)),
                                color: themeData.primaryColor,
                                splashColor: themeData.splashColor,
                                highlightColor: themeData.primaryColor,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                    Translator.translate("text_submit")
                                        .toUpperCase(),
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        color: themeData.colorScheme.onPrimary,
                                        fontWeight: 600,
                                        letterSpacing: 0.8)),
                                padding: EdgeInsets.only(
                                    top: MySize.size12, bottom: MySize.size12),
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
