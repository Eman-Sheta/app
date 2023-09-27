import 'package:app_islami/hadeth/item_hadeth_name.dart';
import 'package:app_islami/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethlines = [];

  @override
  Widget build(BuildContext context) {
    if (hadethlines.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/ahadeth_image.png')),
        Divider(
          color: MyTheme.yellowColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context).textTheme.titleMedium),
        Divider(
          color: MyTheme.yellowColor,
          thickness: 3,
        ),
        hadethlines.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColorDark,
                ),
              )
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: MyTheme.yellowColor,
                      thickness: 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(hadeth: hadethlines[index]);
                  },
                  itemCount: hadethlines.length,
                ),
              )
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> ahadethLines = ahadethList[i].split('\n');
      String title = ahadethLines[0];
      ahadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(content: ahadethLines, title: title);
      hadethlines.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;

  List<String> content;

  Hadeth({required this.content, required this.title});
}
