import 'package:app_islami/language_bottom_sheet.dart';
import 'package:app_islami/provider/app_config_provider.dart';
import 'package:app_islami/theme_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: InkWell(
              onTap: () {
                showLanguageBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15)),
            child: InkWell(
              onTap: () {
                showThemeBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: ((context) => LangusgeBottomSheet()));
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
