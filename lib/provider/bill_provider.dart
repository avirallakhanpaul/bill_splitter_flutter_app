import "package:flutter/material.dart";

class BillProvider with ChangeNotifier {

  var billAmount = 0.0;
  var totalBillPerPerson = 0.0;
  var tip = 0.0;
  var contactCardCounter = 1;
  var personCounter = 1;

  void setBillAmount(double value) {

    billAmount = value;
    calculateTotalPerPerson();
    notifyListeners();
  }

  void setTipAmount(double value) {

    tip = value;
    calculateTotalPerPerson();

    notifyListeners();
  }

  void changeNumOfPerson(String incOrDec) {

    if(incOrDec == "-") {
      if(personCounter > 1) {
        personCounter--;
        contactCardCounter--;
      }
    } else if(incOrDec == "+") {
        personCounter++;
        contactCardCounter++;
    }

    calculateTotalPerPerson();
    notifyListeners();
  }

  double calculateTotalTip(int tipPercentage) {

    tip = double.parse(((billAmount * tipPercentage) / 100).toStringAsFixed(2));

    // calculateTotalPerPerson();

    return tip;
  }

  double calculateTotalPerPerson() {

    // double returnedTip = calculateTotalTip(tipPerc);

    totalBillPerPerson = double.parse(((tip + billAmount) / personCounter).toStringAsFixed(2));

    notifyListeners();

    return totalBillPerPerson;
  }

  // void calculateBillAmount() {
  //   billAmount += tip;
  //   notifyListeners();
  // }
}