import 'package:marketplace_store_app/app/utils/object/object_utils.dart';

import '../code_response.dart';

class ResponsePaginated<T> {
  T data;
  int page;
  int items;
  int total;
  dynamic error;
  dynamic others;


  ResponsePaginated({
      this.data, this.page, this.items, this.total, this.error, this.others});


  factory ResponsePaginated.fromMap(
      dynamic map, dynamic data) {
    if (null == map) return null;
    var temp;
    return ResponsePaginated(
      data: data ?? map['data'],
      page: null == (temp = map['page'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      items: null == (temp = map['items'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      total: null == (temp = map['total'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      error: map['error'],
      others: map['others'],
    );
  }
  factory ResponsePaginated.fromMapSimple(T content,
      {dynamic others, int status}) {
    return ResponsePaginated(
        data: content ?? [], others: others);
  }

  static ResponsePaginated fromSimpleResponse(CodeResponse response) {
    return ResponsePaginated(
        error: response.error == null
            ? null
            : response.error is Map
                ? response.error["titulo"]
                : response.error,
        data: response.sucess);
  }
}
