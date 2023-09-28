import 'dart:math';

import 'package:app_islami/my_theme.dart';
import 'package:app_islami/provider/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  int countingDhikr = 0;
  List<String> dhikr = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
    'لا حول ولا قوة إلا بالله',
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(children: [
      provider.isDarkMode()
          ? Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0),
              child: Image.asset('assets/images/hand_sebha_dark.png'),
            )
          : Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0),
              child: Image.asset('assets/images/hand_sebha_light.png'),
            ),
      provider.isDarkMode()
          ? InkWell(
              onTap: changedDhikr,
              child: Transform.rotate(
                  angle: pi / 360,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Image.asset('assets/images/circle_sebha_dark.png'),
                  )),
            )
          : InkWell(
              onTap: changedDhikr,
              child: Image.asset('assets/images/circle_sebha_light.png'),
            ),
      SizedBox(
        height: 10,
      ),
      provider.isDarkMode()
          ? Text(AppLocalizations.of(context)!.number_of_praises,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: MyTheme.whiteColor))
          : Text(AppLocalizations.of(context)!.number_of_praises,
              style: Theme.of(context).textTheme.titleSmall),
      SizedBox(
        height: 15,
      ),
      provider.isDarkMode()
          ? Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.primaryDark),
                    foregroundColor:
                        MaterialStateProperty.all(MyTheme.whiteColor),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 20))),
                onPressed: () {},
                child: Text(
                  '$counter',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: MyTheme.whiteColor),
                ),
              ),
            )
          : Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all(MyTheme.blackColor),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 20))),
                onPressed: () {},
                child: Text(
                  '$counter',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
      SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          provider.isDarkMode()
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.yellowColor),
                        foregroundColor:
                            MaterialStateProperty.all(MyTheme.blackColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 20))),
                    onPressed: () {},
                    child: Text(
                      dhikr[counter % dhikr.length],
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: MyTheme.blackColor),
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        foregroundColor:
                            MaterialStateProperty.all(MyTheme.blackColor),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 20))),
                    onPressed: () {},
                    child: Text(
                      dhikr[counter % dhikr.length],
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: MyTheme.whiteColor),
                    ),
                  ),
                ),
        ],
      ),
    ]);
  }

  changedDhikr() {
    counter++;
    if (counter % dhikr.length == 0) {
      counter = 0;
    }
    setState(() {});
  }
}
