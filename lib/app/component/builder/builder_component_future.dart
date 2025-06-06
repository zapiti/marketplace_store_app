import 'package:flutter/material.dart';
import 'package:new_marketplace_app/app/component/load/load_elements.dart';


Widget builderComponentFuture<T>(
    {required Future<T> future, required Function buildBodyFunc, bool enableLoad = true}) {
  return FutureBuilder<dynamic>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!enableLoad) {
          return buildBodyFunc(snapshot.data);
        } else if (snapshot.data == null) {
          return loadElements(context);
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return loadElements(context);
            default:
              if (snapshot.data == -1) {
                return loadElements(context);
              } else {
                return buildBodyFunc(snapshot.data);
              }
          }
        }
      });
}
