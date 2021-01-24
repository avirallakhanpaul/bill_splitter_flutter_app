import "package:flutter/material.dart";

import "package:hexcolor/hexcolor.dart";

import '../../screens/history_screen/widgets/history_details.dart';

class HistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

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
                            "History",
                            style: textTheme.bodyText1,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  HistoryDetails(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}