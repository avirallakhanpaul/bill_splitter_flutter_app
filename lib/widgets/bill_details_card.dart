import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "./split.dart";
import "../provider/bill_provider.dart";

class BilldetailsCard extends StatefulWidget {

  @override
  _BilldetailsCardState createState() => _BilldetailsCardState();
}

class _BilldetailsCardState extends State<BilldetailsCard> {
  
  int _tipPerc = 20;

  @override
  Widget build(BuildContext context) {
    
    final billProvider = Provider.of<BillProvider>(context);
    Color priThemeColor = Theme.of(context).primaryColor;

    // double billValue;

    double getTipAmount() {
      return billProvider.calculateTotalTip(_tipPerc);
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: .8,
          color: priThemeColor,
        ),
      ),
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(
              color: priThemeColor,
            ),
            decoration: InputDecoration(
              // prefixText: "Bill Amount",
              prefixIcon: Icon(Icons.money),
              labelText: "Bill Amount",
            ),
            onChanged: (String value) {
              // billValue = double.parse(value);
              billProvider.setBillAmount(
                double.parse(value),
                _tipPerc
              );
            }
          ),
          SizedBox(
            height: 20,
          ),
          Split(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tip",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                "₹ ${getTipAmount()}",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              Text(
                "$_tipPerc%",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Slider(
                value: _tipPerc.toDouble(),
                min: 0,
                max: 100,
                activeColor: priThemeColor,
                inactiveColor: Colors.grey,
                divisions: 10,
                onChanged: (double newValue) {
                  setState(() {
                    _tipPerc = newValue.round();
                  });
                  billProvider.tipPerc = _tipPerc;
                  billProvider.calculateTotalPerPerson();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}