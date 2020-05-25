import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:glogdev/localization/glog_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        GlogLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ko'),
      ],
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
        for (var support in supportedLocales) {
          if (locale == support) return locale;
        }
        for (var support in supportedLocales) {
          if (locale.languageCode == support.languageCode) return support;
        }
        return supportedLocales.first;
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
