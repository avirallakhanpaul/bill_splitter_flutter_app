import '../../../widgets/contact_card.dart';
import "package:flutter/material.dart";

import "package:hexcolor/hexcolor.dart";

class HistoryDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ContactCard(),
                  // ContactCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}