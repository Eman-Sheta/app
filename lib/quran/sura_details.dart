import 'package:app_islami/quran/item_sura_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Suradetails extends StatefulWidget {
  static const String routeName = 'sura_screen';

  @override
  State<Suradetails> createState() => _SuradetailsState();
}

class _SuradetailsState extends State<Suradetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      Image.asset(
        'assets/images/background_light.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
          appBar: AppBar(
            title: Text(
              '${args.name}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: verses.length == 0
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.06),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Theme.of(context).primaryColor,
                        thickness: 1,
                      );
                    },
                    itemBuilder: ((context, index) {
                      return ItemSuraDetails(
                        content: verses[index],
                        index: index,
                      );
                    }),
                    itemCount: verses.length,
                  ),
                ))
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
