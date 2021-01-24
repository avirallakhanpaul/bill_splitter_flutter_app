import "package:flutter/material.dart";
import 'package:provider/provider.dart';

// import 'screens/home_screen/home_screen.dart';
import './screens/tabs_screen/tabs_screen.dart';
import './provider/bill_provider.dart';
import './provider/contact_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => BillProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ContactProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
              letterSpacing: 0.6,
            ),
            headline2: TextStyle(
              fontSize: 18,
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w700,
            ),
            headline3: TextStyle( // Detail Headline Text (Split, Tip)
              fontSize: 14,
              fontFamily: "ProductSans",
              fontWeight: FontWeight.w100,
              color: Colors.grey.shade700,
            ),
            bodyText1: TextStyle( // Total Bill Per Person Heading
              fontFamily: "ProductSans",
              fontWeight: FontWeight.normal,
              fontSize: 35,
              color: Colors.white,
            ),
            bodyText2: TextStyle( // Total Bill Amount (Rs)
              fontFamily: "ProductSans",
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        home: Tabs(),
      ),
    );
  }
}