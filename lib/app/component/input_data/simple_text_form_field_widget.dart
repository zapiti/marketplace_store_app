import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class SimpleTextFormFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool? obscure;
  final Function()? onTap;
  final ValueChanged<String>? onChange;
  final TextInputType? keyboard;
  final InputDecoration? decoration;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Function(String)? validator;
  final bool? enable;

  SimpleTextFormFieldWidget(
      {required this.title,
      required this.controller,
      this.decoration,
      this.keyboard,
      this.obscure,
      this.onChange,
      this.onTap,
      this.suffixIcon,
      this.validator,
      this.enable,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  padding: EdgeInsets.only(top: 5, bottom: 0),
                  child: Text(
                    title,
                    maxLines: 1,
                    style: AppThemeUtils.smallSize(color: AppThemeUtils.black),
                  )),
              GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: TextFormField(
                      autocorrect: false,

                      controller: controller,
                      obscureText: obscure == true,
                      enabled: enable ?? onTap == null,
                      onChanged: onChange,
                      keyboardType: keyboard,
                      cursorColor: AppThemeUtils.colorPrimary,
                      decoration: decoration ??
                          InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: AppThemeUtils.colorPrimary,
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: AppThemeUtils.colorPrimary,
                                ),
                              ),
                              hintText: "",
                              suffixIcon: suffixIcon == null
                                  ? null
                                  : Icon(
                                      suffixIcon,
                                      color: AppThemeUtils.colorPrimary,
                                    ),
                              prefixIcon: prefixIcon == null
                                  ? null
                                  : Icon(
                                      prefixIcon,
                                      color: AppThemeUtils.colorPrimary,
                                    ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppThemeUtils.colorPrimary))),
                    ),
                  ))
            ]),
      ),
    );
  }
}
