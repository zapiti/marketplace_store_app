class CustomAttach {
  String name;
  String type;
  String data;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'base64': getBase64ToMap(),
    };
  }

  String getBase64ToMap() {
    return 'data:$type;$data';
  }
}
