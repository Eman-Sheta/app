import 'package:app_islami/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          provider.isDarkMode()
              ? Image.asset('assets/images/radio_image.png')
              : Image.asset('assets/images/radio_image.png'),
          SizedBox(
            height: 50,
          ),
          Text(
            AppLocalizations.of(context)!.holy_quran_radio,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 50,
          ),
          Image.asset('assets/images/play_radio.png')
        ],
      ),
    );
  }
}