import 'package:app_islami/hadeth/hadeth_details.dart';
import 'package:app_islami/hadeth/hadeth_tab.dart';
import 'package:flutter/material.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Hadethdetails.routeName,
          arguments: hadeth,
        );
      },
      child: Text(
        hadeth.title,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
