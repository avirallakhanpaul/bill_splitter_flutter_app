// import 'package:contacts_service/contacts_service.dart';
import 'package:contact_picker/contact_picker.dart';
import "package:flutter/material.dart";
import 'package:permission_handler/permission_handler.dart';

class ContactProvider with ChangeNotifier {

  Future<Contact> getContact() async {

    final ContactPicker _contactPicker = ContactPicker();
    Contact _contact;
    
    var status = await Permission.contacts.status;

    if(!status.isGranted) {

      await Permission.contacts.request();

      if(await Permission.contacts.isGranted) {

        _contact = await _contactPicker.selectContact();
        return _contact;
      }
    } else {

      _contact = await _contactPicker.selectContact();
      return _contact;
    }
  }
}