import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppTheme.dart';
import 'AppThemeNotifier.dart';

class SelectLanguageDialog extends StatefulWidget {
  @override
  _SelectLanguageDialogState createState() => _SelectLanguageDialogState();
}

class _SelectLanguageDialogState extends State<SelectLanguageDialog> {
  ThemeData themeData;

  String langCode = 'en';

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    loadLanguage();
  }

  Future<void> loadLanguage() async {
    String language = await AllLanguage.getLanguage();
    print(language);
    setState(() {
      langCode = language;
    });
  }

  Future<void> _handleRadioValueChange(String langCode) async {
    await Translator.load(langCode);
    Navigator.pop(context);
    Provider.of<AppThemeNotifier>(context, listen: false).notify();
  }

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
      builder: (BuildContext context, AppThemeNotifier value, Widget child) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.only(top: MySize.size16, bottom: MySize.size16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _handleRadioValueChange('en');
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MySize.size16, right: MySize.size16),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: langCode,
                          value: 'en',
                          activeColor: themeData.colorScheme.primary,
                        ),
                        Text("English",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _handleRadioValueChange('es');
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MySize.size16, right: MySize.size16),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: langCode,
                          value: 'es',
                          activeColor: themeData.colorScheme.primary,
                        ),
                        Text("Española",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _handleRadioValueChange('fr');
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MySize.size16, right: MySize.size16),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: langCode,
                          value: 'fr',
                          activeColor: themeData.colorScheme.primary,
                        ),
                        Text("français",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _handleRadioValueChange('hi');
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MySize.size16, right: MySize.size16),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: langCode,
                          value: 'hi',
                          activeColor: themeData.colorScheme.primary,
                        ),
                        Text("हिन्दी",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _handleRadioValueChange('zh');
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: MySize.size16, right: MySize.size16),
                    child: Row(
                      children: <Widget>[
                        Radio(
                          onChanged: (value) {
                            _handleRadioValueChange(value);
                          },
                          groupValue: langCode,
                          value: 'zh',
                          activeColor: themeData.colorScheme.primary,
                        ),
                        Text("中文",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle2,
                                fontWeight: 600)),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MySize.size8),
                  child: Text(
                    "More languages are coming soon...",
                    style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                        fontWeight: 500),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
