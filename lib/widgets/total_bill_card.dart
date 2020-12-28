import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../provider/bill_provider.dart";

class TotalBillCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final billProvider = Provider.of<BillProvider>(context);
    final Size mediaQuery = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: mediaQuery.height * 0.15,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Total bill per person",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "₹ ${billProvider.totalBillPerPerson}",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}