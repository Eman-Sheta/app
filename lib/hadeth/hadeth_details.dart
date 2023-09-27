import 'package:app_islami/hadeth/hadeth_tab.dart';
import 'package:app_islami/hadeth/item_hadeth_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Hadethdetails extends StatefulWidget {
  static const String routeName = 'hadeth_screen';

  @override
  State<Hadethdetails> createState() => _HadethdetailsState();
}

class _HadethdetailsState extends State<Hadethdetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
              '${args.title}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.06),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return ItemHadethDetails(content: args.content[index]);
              }),
              itemCount: args.content.length,
            ),
          ))
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    setState(() {});
  }
}
