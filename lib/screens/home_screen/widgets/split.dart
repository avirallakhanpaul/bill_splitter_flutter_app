import "package:flutter/material.dart";
import "package:provider/provider.dart";

import '../../../provider/bill_provider.dart';

class Split extends StatelessWidget {

  // final Function changeNumOfPerson;
  // final int personCounter;

  // Split(this.changeNumOfPerson, this.personCounter);

  @override
  Widget build(BuildContext context) {

    // print("SPLIT build");

    final billProvider = Provider.of<BillProvider>(context);
    final Color priThemeColor = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Split Between",
          style: Theme.of(context).textTheme.headline2,
        ),
        Row(
          children: <Widget>[
            InkWell(
              onTap: () => billProvider.changeNumOfPerson("-"),
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: priThemeColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "${billProvider.personCounter}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () => billProvider.changeNumOfPerson("+"),
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: priThemeColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}