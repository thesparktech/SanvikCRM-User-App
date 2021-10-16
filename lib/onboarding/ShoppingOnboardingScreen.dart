import 'package:SanvikSystem/app_localizations.dart';
import 'package:SanvikSystem/layout1/ShoppingLoginScreen.dart';
import 'package:SanvikSystem/utils/Generator.dart';
import 'package:SanvikSystem/utils/SizeConfig.dart';
import 'package:SanvikSystem/utils/custom/onBoarding/CustomOnBoardingWidget.dart';
import 'package:SanvikSystem/utils/custom/onBoarding/UI/pages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../AppThemeNotifier.dart';

class ShoppingOnboardingScreen extends StatefulWidget {
  ShoppingOnboardingScreen({Key key}) : super(key: key);

  @override
  _ShoppingOnboardingScreenState createState() =>
      _ShoppingOnboardingScreenState();
}

class _ShoppingOnboardingScreenState extends State<ShoppingOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Consumer<AppThemeNotifier>(
        builder: (BuildContext context, AppThemeNotifier value, Widget child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getThemeFromThemeMode(value.themeMode()),
          home: Scaffold(
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  color: themeData.backgroundColor,
                  child: CustomOnBoardingWidget(
                    pages: <PageViewModel>[
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(MySize.size40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/illu-1.png'),
                                width: MySize.getScaledSizeHeight(300),
                                height: MySize.getScaledSizeHeight(320),
                              )),
                              SizedBox(height: MySize.size30),
                              Text(
                                  Translator.translate(
                                      "long_text_onboarding_1"),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText1,
                                      fontWeight: 800)),
                              SizedBox(height: MySize.size16),
                              Text(Generator.getDummyText(10),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600)),
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(MySize.size40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/illu-2.png'),
                                width: MySize.getScaledSizeHeight(300),
                                height: MySize.getScaledSizeHeight(320),
                              )),
                              SizedBox(height: MySize.size30),
                              Text(
                                Translator.translate("long_text_onboarding_2"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 800),
                              ),
                              SizedBox(height: MySize.size16),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600))
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        themeData.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(MySize.size40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/illu-3.png'),
                                width: MySize.getScaledSizeHeight(300),
                                height: MySize.getScaledSizeHeight(320),
                              )),
                              SizedBox(height: MySize.size30),
                              Text(
                                Translator.translate("long_text_onboarding_3"),
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText1,
                                    fontWeight: 800),
                              ),
                              SizedBox(height: MySize.size16),
                              Text(
                                  'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      fontWeight: 600)),
                            ],
                          ),
                        ),
                      ),
                    ],
                    unSelectedIndicatorColor: themeData.colorScheme.secondary,
                    selectedIndicatorColor: themeData.colorScheme.primary,
                    doneWidget: Material(
                      child: InkWell(
                        splashColor: themeData.colorScheme.secondary,
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingLoginScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(MySize.size8),
                          child: Text(
                              Translator.translate("text_done").toUpperCase(),
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.subtitle2,
                                  fontWeight: 800,
                                  color: themeData.colorScheme.primary)),
                        ),
                      ),
                    ),
                    skipWidget: Material(
                      child: InkWell(
                        splashColor: themeData.colorScheme.secondary,
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShoppingLoginScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.all(MySize.size8),
                          child: Text(
                              Translator.translate("text_skip").toUpperCase(),
                              style: themeData.textTheme.subtitle2.merge(
                                  TextStyle(
                                      color: themeData.colorScheme.secondary,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.6))),
                        ),
                      ),
                    ),
                  ))));
    });
  }
}
