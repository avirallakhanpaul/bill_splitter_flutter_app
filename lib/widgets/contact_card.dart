import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';

class ContactCard extends StatefulWidget {

  final pNumber;
  final fullName; 
  
  ContactCard({
    this.pNumber,
    this.fullName,
  });

  bool isExpanded = false;

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: widget.isExpanded == true 
            ? mediaQuery.height * 0.2
            : mediaQuery.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              ),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.check_circle,
                          color: HexColor("#3F5D9E"),
                          size: 30,
                        ),
                      // alignment: Alignment.topLeft,
                        onPressed: () {},
                      ),
                      Text(
                        widget.fullName.toString(),
                        style: textTheme.headline2,
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 5,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Paid",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "ProductSans",
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.chat,
                          color: Colors.green,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          widget.isExpanded == true 
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.isExpanded = !widget.isExpanded;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}