import 'package:bill_splitter_app_udemy/widgets/contact_card.dart';
import "package:flutter/material.dart";

// import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import "package:contact_picker/contact_picker.dart";
// import "package:permission_handler/permission_handler.dart";
import 'package:provider/provider.dart';

import "../../../provider/contact_provider.dart";

class AddContactCard extends StatefulWidget {

  bool isContactAdded = false;

  @override
  _AddContactCardState createState() => _AddContactCardState();
}

class _AddContactCardState extends State<AddContactCard> {

  Contact contact;

  // Future<void> getContactDetail(Provider provider) async {

    
  // }

  @override
  Widget build(BuildContext context) {

    // final contactProvider = Provider.of<ContactProvider>(context);
    Size mediaQuery = MediaQuery.of(context).size;

    return Consumer<ContactProvider>(
      builder: (ctx, contactProvider, _) {
        return Column(
          children: <Widget>[
            widget.isContactAdded == false 
              ? InkWell(
                  onTap: () async {
                    contact = await contactProvider.getContact();

                    if(contact.phoneNumber != null) {
                      setState(() {
                        widget.isContactAdded = true;
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: mediaQuery.height * 0.085,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        // vertical: 8.0,
                        horizontal: 15.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: mediaQuery.height * 0.05,
                            height: mediaQuery.height * 0.05,
                            decoration: BoxDecoration(
                              // color: Colors.transparent,
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Add a Contact",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Product Sans",
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            : ContactCard(pNumber: contact.phoneNumber, fullName: contact.fullName,),
          ],
        );
      },
    );
  }
}