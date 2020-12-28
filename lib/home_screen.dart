import "package:flutter/material.dart";

import "./widgets/total_bill_card.dart";
import './widgets/bill_details_card.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bill Splitter",
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: <Widget>[
                TotalBillCard(),
                SizedBox(
                  height: 20,
                ),
                BilldetailsCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

