import 'dart:convert';
import 'dart:typed_data';

extension StringExtension on String {
  Uint8List getImage() {
    if (this != null && this.isNotEmpty) {
      if (this.contains(",")) {
        return Base64Decoder().convert(this.replaceAll("\n", "").split(",")[1]);
      } else {
        return Base64Decoder().convert(this.replaceAll("\n", ""));
      }
    } else {
      return null;
    }
  }

  String removeMasks() {
    return this
        .trim()
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(" ", "")
        .replaceAll("-", "")
        .replaceAll("/", "");
  }
}
