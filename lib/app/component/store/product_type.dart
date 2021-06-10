import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_app/app/utils/market/utils_market.dart';
import 'package:marketplace_store_app/app/utils/market/utils_product.dart';

class ProductType extends StatefulWidget {
  final TextEditingController typeController;

  ProductType(this.typeController);

  @override
  _ProductTypeState createState() => _ProductTypeState();
}

class _ProductTypeState extends State<ProductType> {
  var valueProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
          width: double.infinity,
          height: 55,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.5, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          child: Center(
              child: DropdownButton<String>(
            isExpanded: true,
            underline: DropdownButtonHideUnderline(child: Container()),
            items: UtilsProduct.listTypeProduct.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            hint: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(valueProduct ?? "Categoria do produto")),
            onChanged: (value) {
              widget.typeController.text = value;

              setState(() {
                valueProduct = value;
              });
            },
          ))),
    );
  }
}
