import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_app/app/utils/utils_market.dart';

class StoreType extends StatefulWidget {
  final TextEditingController typeController;

  StoreType(this.typeController);

  @override
  _StoreTypeState createState() => _StoreTypeState();
}

class _StoreTypeState extends State<StoreType> {
  var valueStableciment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      child:Container(
      width: double.infinity,
      height: 55,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.5, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      child: Center(child:   DropdownButton<String>(isExpanded: true,
            underline: DropdownButtonHideUnderline(child: Container()),
            items: UtilsMarket.listTypeMarket.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            hint: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child:  Text(valueStableciment ?? "Tipo de estabelecimento")),
            onChanged: (value) {
              widget.typeController.text = value;

              setState(() {
                valueStableciment = value;
              });
            },
          ))),
    );
  }
}
