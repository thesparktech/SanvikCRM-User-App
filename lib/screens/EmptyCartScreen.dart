import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class EmptyCartScreen extends StatefulWidget {
  @override
  _EmptyCartScreenState createState() => _EmptyCartScreenState();
}

class _EmptyCartScreenState extends State<EmptyCartScreen> {
  ThemeData themeData;

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
                  title: Text(Translator.translate("text_cart"),
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.headline6,
                          fontWeight: 600)),
                ),
                backgroundColor: themeData.backgroundColor,
                body: Container(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: Image(
                            image: AssetImage(
                              './assets/illustration/empty-cart.png',
                            ),
                            height: MySize.safeWidth * 0.5,
                            width: MySize.safeWidth * 0.5,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: Text(
                            Translator.translate("text_your_cart_is_empty"),
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600,
                                letterSpacing: 0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: MySize.size24),
                          child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: MySize.size12,
                                  horizontal: MySize.size12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              color: themeData.colorScheme.primary,
                              highlightColor: themeData.colorScheme.primary,
                              splashColor: Colors.white.withAlpha(100),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                  Translator.translate("text_lets_shopping"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600,
                                      color: themeData.colorScheme.onPrimary,
                                      letterSpacing: 0.5))),
                        )
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
