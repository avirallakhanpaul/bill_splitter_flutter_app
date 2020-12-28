import "package:flutter/material.dart";

class BillProvider with ChangeNotifier {

  var billAmount = 0.0;
  var totalBillPerPerson = 0.0;
  var tip = 0.0;
  var tipPerc = 0;
  var personCounter = 1;

  void setBillAmount(double value, int tipPerc) {

    billAmount = value;
    calculateTotalPerPerson();
    notifyListeners();
  }

  void changeNumOfPerson(String incOrDec) {

    if(incOrDec == "-") {
      if(personCounter > 1) {
        personCounter--;
      }
    } else if(incOrDec == "+") {
        personCounter++;
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

    double returnedTip = calculateTotalTip(tipPerc);

    totalBillPerPerson = double.parse(((returnedTip + billAmount) / personCounter).toStringAsFixed(2));

    notifyListeners();

    return totalBillPerPerson;
  }

  // void calculateBillAmount() {
  //   billAmount += tip;
  //   notifyListeners();
  // }
}