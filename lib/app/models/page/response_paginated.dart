import 'package:new_marketplace_app/app/utils/object/object_utils.dart';

import '../code_response.dart';

class ResponsePaginated<T> {
  T? data;
  int? page;
  int items;
  int total;
  dynamic error;
  dynamic others;


  ResponsePaginated({
       this.data , this.page,  this.items = 0,  this.total = 0, this.error, this.others});


  static ResponsePaginated? fromMap(
      dynamic map, dynamic data) {
    if (null == map) return null;
    var temp;
    return ResponsePaginated(
      data: data ?? map['data'],
      page: null == (temp = map['page'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      items: null == (temp = map['items'])
          ? 0
          : (temp is num ? temp.toInt() : int.tryParse(temp)) ?? 0,
      total: null == (temp = map['total'])
          ? 0
          : (temp is num ? temp.toInt() : int.tryParse(temp)) ?? 0,
      error: map['error'],
      others: map['others'],
    );
  }
  static ResponsePaginated? fromMapSimple( content,
      {dynamic others, int? status}) {
    return ResponsePaginated(
        data: content , others: others);
  }

  static ResponsePaginated fromSimpleResponse(CodeResponse? response) {
    return ResponsePaginated(
        error: response?.error == null
            ? null
            : response?.error is Map
                ? response?.error["titulo"]
                : response?.error,
        data: response?.sucess);
  }
}
