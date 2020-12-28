import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import './home_screen.dart';
import './provider/bill_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (ctx) => BillProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: Colors.white,
              letterSpacing: 0.6,
            ),
            bodyText1: TextStyle( // Total Bill Per Person Heading
              fontFamily: "ProductSans",
              fontWeight: FontWeight.normal,
              fontSize: 20,
              color: Theme.of(context).primaryColorDark,
            ),
            bodyText2: TextStyle( // Total Bill Amount (Rs)
              fontFamily: "ProductSans",
              fontSize: 40,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColorDark,
            ),
            headline2: TextStyle( // Detail Headline Text (Split, Tip)
              fontSize: 18,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}