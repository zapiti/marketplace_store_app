import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:new_marketplace_app/app/extension/string_extension.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class SimpleImageFieldWidget extends StatelessWidget {
  final String? image;
  final Function? selectImage;
  final String? url;

  SimpleImageFieldWidget({this.image, required this.selectImage, this.url});

  @override
  Widget build(BuildContext context) {
    Uint8List? memoryImage =
        image?.isNotEmpty == true ? image?.getImage() : null;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            selectImage?.call();
          },
          child: Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: memoryImage == null && url == null
                ? Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 100,
                    color: AppThemeUtils.colorPrimary,
                  )
                : Container(
                    child: url != null
                        ? Image.network(url!)
                        : Image.memory(memoryImage!)),
            decoration: memoryImage == null && url == null
                ? null
                : BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(75)),
                    border:
                        Border.all(color: AppThemeUtils.colorPrimary, width: 2),
                    color: AppThemeUtils.colorPrimary),
          ),
        ),
      ],
    );
  }
}
