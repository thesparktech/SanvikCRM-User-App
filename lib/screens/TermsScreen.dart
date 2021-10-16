import 'package:SanvikSystem/AppTheme.dart';
import 'package:SanvikSystem/AppThemeNotifier.dart';
import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  ThemeData themeData;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => TermsDialog());
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
                body: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(MySize.size8)),
                      boxShadow: [
                        BoxShadow(
                          color: themeData.colorScheme.primary.withAlpha(20),
                          blurRadius: 2,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(MySize.size4)),
                        color: themeData.colorScheme.primary,
                        splashColor: Colors.white,
                        onPressed: () {
                          _showDialog();
                        },
                        child: Text(
                          Translator.translate("text_read_terms"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600,
                              color: themeData.colorScheme.onPrimary),
                        )),
                  ),
                )));
      },
    );
  }
}

class TermsDialog extends StatefulWidget {
  @override
  _TermsDialogState createState() => _TermsDialogState();
}

class _TermsDialogState extends State<TermsDialog> {
  bool isChecked = false;

  String text1, text2, text3, text4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text1 = Generator.getDummyText(16);
    text2 = Generator.getDummyText(12);
    text3 = Generator.getDummyText(20);
    text4 = Generator.getDummyText(24);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                        Translator.translate("text_terms") +
                            " \& " +
                            Translator.translate("text_condition"),
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.headline6,
                            fontWeight: 600)),
                  ),
                ),
                Icon(MdiIcons.download)
              ],
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(top: MySize.size8),
              child: Text(
                "1. " + Translator.translate("text_return_policy"),
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.primary, fontWeight: 600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8),
              child: Text(
                text1,
                style: AppTheme.getTextStyle(
                  themeData.textTheme.bodyText2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16),
              child: Text(
                "2. " + Translator.translate("text_replace_policy"),
                style: AppTheme.getTextStyle(
                  themeData.textTheme.subtitle1,
                  color: themeData.colorScheme.primary,
                  fontWeight: 600,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8),
              child: Text(
                text2,
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 500,
                    height: 1.25,
                    letterSpacing: 0.1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16),
              child: Text(
                "3. " + Translator.translate("text_coupon_policy"),
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.primary, fontWeight: 600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8),
              child: Text(
                text3,
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 500,
                    height: 1.25,
                    letterSpacing: 0.1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16),
              child: Text(
                "4. " + Translator.translate("text_other"),
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.primary, fontWeight: 600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size8),
              child: Text(
                text4,
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground,
                    fontWeight: 500,
                    height: 1.25,
                    letterSpacing: 0.1),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MySize.size16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                  ),
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: MySize.size0),
                        child: Text(
                          Translator.translate("long_text_terms_accept"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              color: themeData.colorScheme.onBackground,
                              fontWeight: 500),
                        )),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 8),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(0),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(Translator.translate("text_decline"),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                fontWeight: 600))),
                    FlatButton(
                        color: Colors.transparent,
                        padding: EdgeInsets.all(0),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          Translator.translate("text_accept"),
                          style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              fontWeight: 600,
                              color: themeData.colorScheme.primary),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
