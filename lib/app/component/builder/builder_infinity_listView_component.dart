import 'package:flutter/material.dart';
import 'package:new_marketplace_app/app/component/load/load_elements.dart';
import 'package:new_marketplace_app/app/models/page/response_paginated.dart';

Widget builderInfinityListViewComponent(ResponsePaginated? response,
    {Function? callMoreElements,
    Function? buildBody,
    Function? headerWidget,
    String? errorResponse,
    String? emptyMessage}) {
  return ListView.builder(
    padding: EdgeInsets.only(bottom: 80),
    reverse: false,
    itemCount: response?.data.length + 1,
    itemBuilder: (context, index) {
      if (index < (response?.data.length ?? 0)) {
        return Flex(direction: Axis.vertical, children: [
          headerWidget != null && index == 0 ? headerWidget() : SizedBox(),
          buildBody?.call(response?.data[index])
        ]);
      } else {
        if (response?.data.length >= 1) {
          var _page = (response?.page ?? 0) + 1;
          if ((response?.data.length < response?.total && (response?.total ?? 0) > 0)) {
            callMoreElements?.call(_page);
            return loadElements(context, size: 80);
          } else {
            return SizedBox();
          }
        } else {
          return Container();
        }
      }
    },
  );
}

GridView builderInfinityGridViewComponent(
    BuildContext context, ResponsePaginated? response,
    {Function? callMoreElements, Function? buildBody}) {
  double? cardWidth = MediaQuery.of(context).size.width / 3.3;
  double? cardHeight = 150;
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: cardWidth / cardHeight,
    ),
    padding: EdgeInsets.only(bottom: 80),
    reverse: false,
    itemCount: response?.data.length + 1,
    itemBuilder: (context, index) {
      if (index < (response?.data.length ?? 0)) {
        return buildBody?.call(response?.data[index]);
      } else {
        if (response?.data.length >= 1) {
          var _page = (response?.page ?? 0) + 1;
          if (!(response?.page == response?.total)) {
            callMoreElements?.call(_page);
            return loadElements(context, size: 80);
          } else {
            return SizedBox();
          }
        } else {
          return Container();
        }
      }
    },
  );
}
