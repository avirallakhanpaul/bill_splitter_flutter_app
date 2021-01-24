import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../../provider/bill_provider.dart';

class InputDetailsCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    final billProvider = Provider.of<BillProvider>(context);

    return Container(
      width: double.infinity,
      height: mediaQuery.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        prefixText: "₹",
                        labelText: "Bill Amount",
                      ),
                      onChanged: (value) {
                        billProvider.setBillAmount(double.parse(value));
                      }
                    ),
                  ),
                ),
                SizedBox(
                  width: mediaQuery.width * 0.1,
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        prefixText: "₹",
                        labelText: "Tip Amount",
                      ),
                      onChanged: (value) {
                        if(value == "0" || value.isEmpty) {
                          billProvider.setTipAmount(0);
                        }
                        billProvider.setTipAmount(double.parse(value));
                      }
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Split Between",
                  style: textTheme.headline3,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: HexColor("#3F5D9E"),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.remove,
                          size: 25,
                          color: Colors.white,
                        ),
                        onTap: () {
                          billProvider.changeNumOfPerson("-");
                        }
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      billProvider.personCounter.toString(),
                      style: textTheme.headline2,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: HexColor("#3F5D9E"),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: Colors.white,
                        ),
                        onTap: () {
                          billProvider.changeNumOfPerson("+");
                        }
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}