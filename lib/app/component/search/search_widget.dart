import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_marketplace_app/app/core/util/color_util.dart';

class SearchWidget extends StatelessWidget {
  final String? hint;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;

  SearchWidget({this.hint, this.onSubmitted, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: ColorUtil.greyColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(CupertinoIcons.search),
          ),
          Expanded(
            child: CupertinoTextField(
              placeholder: hint ?? "Pesquisar",
              decoration: BoxDecoration(),
              onSubmitted: (text) {
                onSubmitted?.call(text);
              },
              onChanged: (text) {
                onChanged?.call(text);
              },
              textInputAction: TextInputAction.search,
            ),
          )
        ],
      ),
    );
  }
}
