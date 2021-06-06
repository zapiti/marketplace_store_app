import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_app/app/component/address/cep_controller.dart';

class AddressCepComponent extends StatefulWidget {
  final TextEditingController zipCodeController;
  final TextEditingController addressController;
  final TextEditingController numberController;
  final TextEditingController complementController;
  final TextEditingController neighborhoodController;
  final TextEditingController cityController;
  final TextEditingController stateController;

  AddressCepComponent(
      {this.zipCodeController,
      this.addressController,
      this.numberController,
      this.complementController,
      this.neighborhoodController,
      this.cityController,
      this.stateController});

  @override
  _AddressCepComponentState createState() => _AddressCepComponentState();
}

class _AddressCepComponentState extends State<AddressCepComponent> {
  bool open = false;
  bool enableFields = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CepController.getCepController(
        zipCodeController: widget.zipCodeController,
        addressController: widget.addressController,
        neighborhoodController: widget.neighborhoodController,
        cityController: widget.cityController,
        stateController: widget.stateController,
        enableField: (value) {
          setState(() {
            enableFields = value;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextField(
                controller: widget.zipCodeController,
                onChanged: (text) {
                  if (text.length >= 10 && !open) {
                    setState(() {
                      open = true;
                    });
                  } else if (text.length <= 10 && open) {
                    setState(() {
                      open = false;
                    });
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Cep'),
              )),
          !open
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: TextField(
                    controller: widget.addressController,
                    enabled: enableFields,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: 'Endereço'),
                  )),
          !open
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: TextField(
                    controller: widget.neighborhoodController,
                    enabled: enableFields,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: 'Bairro'),
                  )),
          !open
              ? SizedBox()
              : Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 10, right: 10),
                          child: TextField(
                            controller: widget.numberController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                labelText: 'Número'),
                          )),
                    ),
                    Expanded(
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 10, right: 10),
                          child: TextField(
                            controller: widget.complementController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                labelText: 'Complemento'),
                          )),
                    )
                  ],
                ),
          !open
              ? SizedBox()
              : Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 10, right: 10),
                          child: TextField(
                            controller: widget.cityController,
                            enabled: enableFields,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                labelText: 'Cidade'),
                          )),
                    ),
                    Expanded(
                      child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 10, right: 10),
                          child: TextField(
                            controller: widget.stateController,
                            enabled: enableFields,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                                labelText: 'Estado'),
                          )),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
