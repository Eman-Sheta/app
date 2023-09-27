import 'package:app_islami/hadeth/hadeth_details.dart';
import 'package:app_islami/home_screen.dart';
import 'package:app_islami/my_theme.dart';
import 'package:app_islami/provider/app_config_provider.dart';
import 'package:app_islami/quran/sura_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Suradetails.routeName: (context) => Suradetails(),
        Hadethdetails.routeName: (context) => Hadethdetails(),
      },
      theme: MyTheme.lightMode,
      themeMode: provider.appTheme,
      darkTheme: MyTheme.darkMode,
    );
  }
}
