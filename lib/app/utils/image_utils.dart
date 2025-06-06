import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

class ImageUtils {
  static Image? imageFromBase64String(
    String? base64String, {
    double? height,
    fit,
    double? width,
  }) {
    return base64String == null
        ? null
        : Image.memory(
            base64Decode(base64String),
            height: height,
            width: width,
            fit: fit,
          );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

//  static Future<String> openFileExplorer() async {
//    var _path = await FilePicker.getFilePath(type: null, fileExtension: null);
//    File imageFile = new File(_path);
//    List<int> imageBytes = imageFile.readAsBytesSync();
//    String base64Image = base64.encode(imageBytes);
//    return base64Image;
//  }
}
