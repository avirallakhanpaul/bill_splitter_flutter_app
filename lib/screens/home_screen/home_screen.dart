import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../../provider/bill_provider.dart';
import "./widgets/total_bill_card.dart";
import "./widgets/bill_details_card.dart";

import "package:hexcolor/hexcolor.dart";

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    // double appBarSize = mediaQuery.;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    HexColor("#4B6CB7"),
                    HexColor("#182848"),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0, 
                      left: 15.0, 
                      right: 15.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Bill Splitter",
                            style: textTheme.headline1,
                            // textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Total Bill Per Person",
                            style: textTheme.bodyText1,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Consumer<BillProvider>(
                          builder: (ctx, billProvider, child) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "₹ ${billProvider.totalBillPerPerson}",
                                style: textTheme.bodyText2,
                              ),
                            );
                          }
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  BillDetailsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ListView(
//   children: <Widget>[
//     Container(
//       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//       child: Column(
//         children: <Widget>[
//           TotalBillCard(),
//           SizedBox(
//             height: 20,
//           ),
//           BilldetailsCard(),
//         ],
//       ),
//     ),
//   ],
// ),
