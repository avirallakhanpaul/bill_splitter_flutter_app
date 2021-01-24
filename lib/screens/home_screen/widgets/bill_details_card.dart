import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';
import "package:provider/provider.dart";

import "../../../provider/bill_provider.dart";
// import "./split.dart";
import 'input_details_card.dart';
import './add_contact_card.dart';
// import '../../../widgets/contact_card.dart';

class BillDetailsCard extends StatefulWidget {

  @override
  _BillDetailsCardState createState() => _BillDetailsCardState();
}

class _BillDetailsCardState extends State<BillDetailsCard> {

  @override
  Widget build(BuildContext context) {
    
    final billProvider = Provider.of<BillProvider>(context);
    // Color priThemeColor = Theme.of(context).primaryColor;
    // final Size mediaQuery = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: HexColor("#E9E9E9"),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 15,
            // bottom: 30,
            left: 15,
          ),
          child: ListView(
              children: <Widget>[
                InputDetailsCard(),
                SizedBox(
                  height: 30,
                ),
                ListView.builder(
                  itemCount: billProvider.contactCardCounter,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return AddContactCard();
                  },
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     ContactCard(),
                //     ContactCard(),
                //   ],
                // ),
                FlatButton(
                  color: HexColor("#3F5D9E"),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
        ),
      ),
    );
  }
}