import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:marketplace_store_app/app/component/load/load_elements.dart';
import 'package:marketplace_store_app/app/utils/theme/app_theme_utils.dart';
import 'package:marketplace_store_app/app/utils/string/string_file.dart';

void showGenericDialog(
    {IconData iconData,
    BuildContext context,
    String title,
    String description,
    String subtitle,
    VoidCallback positiveCallback,
    VoidCallback negativeCallback,
    String positiveText,
    String negativeText,
    Color color,
    bool hideSubTitle = true,
    Widget customWidget,
    bool isLight = false,
    bool containsPop = true,
    String imagePath,
    Stream streamLoad,
    Color topColor,
    int multLineButton}) {
  // FocusScope.of(context).requestFocus(FocusNode());
  showDialog(
      context: context,
      builder: (ctx) => _DialogGeneric(
          iconData: iconData,
          title: title,
          description: description,
          topColor: topColor,
          positiveCallback: positiveCallback,
          negativeCallback: negativeCallback,
          positiveText: positiveText,
          subtitle: subtitle,
          customWidget: customWidget,
          containsPop: containsPop,
          negativeText: negativeText,
          imagePath: imagePath,
          streamLoad: streamLoad,
          color: color,
          multLineButton: multLineButton,
          isLight: isLight,
          hideSubTitle: hideSubTitle));
}

class _DialogGeneric extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String description;
  final VoidCallback positiveCallback;
  final VoidCallback negativeCallback;
  final String positiveText;
  final String negativeText;
  final Color color;
  final Color topColor;
  final String subtitle;
  final bool hideSubTitle;
  final bool isLight;
  final bool containsPop;
  final String imagePath;
  final int multLineButton;
  final Widget customWidget;
  final Stream streamLoad;

  _DialogGeneric(
      {this.iconData,
      this.title,
      this.topColor,
      this.description,
      this.positiveCallback,
      this.negativeCallback,
      this.positiveText,
      this.customWidget,
      this.negativeText,
      this.color,
      this.isLight = true,
      this.containsPop = true,
      this.subtitle,
      this.hideSubTitle = true,
      this.imagePath,
      this.multLineButton,
      this.streamLoad});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width > 435
                  ? 350
                  : MediaQuery.of(context).size.width * 0.8,
              child: Material(
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ListBody(children: <Widget>[
                        Container(
                                    padding: EdgeInsets.only(top: 0, bottom: 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      border: Border.all(
                                          color: Colors.white, width: 0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child:  StreamBuilder<bool>(
                                        stream: streamLoad,
                                        initialData: false,
                                        builder: (context, snapshot) => snapshot.data
                                            ? Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            loadElements(context),

                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child:   Text(
                                              "Carregando...",
                                              style: AppThemeUtils.normalSize(color: AppThemeUtils.colorPrimary),
                                            ))
                                          ],
                                        )
                                            :Column(
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    AppThemeUtils.colorPrimary,
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(20),
                                                    topLeft:
                                                        Radius.circular(20))),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,right: 5,
                                                      left: 10),
                                                  child: imagePath != null
                                                      ? Image.asset(
                                                          imagePath,
                                                          height: 60,
                                                          width: 60,
                                                        )
                                                      : Icon(
                                                          iconData ?? Icons.error,
                                                          color: color ??
                                                              AppThemeUtils
                                                                  .whiteColor,
                                                          size: 30,
                                                        ),
                                                ),

                                                Expanded(
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10,
                                                            right: 10),
                                                        child: AutoSizeText(
                                                          title,
                                                          minFontSize: 10,
                                                          maxLines: 1,
                                                          style: AppThemeUtils
                                                              .normalSize(
                                                                  color: color ??
                                                                      AppThemeUtils
                                                                          .whiteColor,
                                                                  fontSize: 18),
                                                        ))),
                                              ],
                                            )),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            border: Border.all(
                                                color: Colors.white, width: 1),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Flexible(
                                                        child: Wrap(
                                                          children: <Widget>[
                                                            customWidget ??
                                                                Padding(
                                                                  padding: EdgeInsets.all(10),
                                                                  child: Text(
                                                                    description,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                    style: AppThemeUtils
                                                                        .normalSize(color: AppThemeUtils.black),
                                                                  ),
                                                                ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10, bottom: 0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    negativeCallback == null
                                                        ? SizedBox()
                                                        : Expanded(
                                                            child: Center(
                                                            child: Container(
                                                                height: 35,
                                                                width: 200,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            10,
                                                                        top: 5),
                                                                child:
                                                                    RaisedButton(
                                                                  color: isLight
                                                                      ? Colors
                                                                          .transparent
                                                                      : AppThemeUtils
                                                                          .colorError,
                                                                  elevation: 0,
                                                                  onPressed:
                                                                      () {
                                                                    negativeCallback();
                                                                    if (containsPop) {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    }
                                                                  },
                                                                  child:
                                                                      AutoSizeText(
                                                                    negativeText ??
                                                                        'Não',
                                                                    maxLines:
                                                                        multLineButton ??
                                                                            1,
                                                                    minFontSize:
                                                                        12,
                                                                    style: AppThemeUtils
                                                                        .normalBoldSize(
                                                                      color: isLight
                                                                          ? AppThemeUtils
                                                                              .colorPrimary
                                                                          : AppThemeUtils
                                                                              .whiteColor,
                                                                    ),
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              5)),
                                                                      side: BorderSide(
                                                                          color: isLight
                                                                              ? Colors.transparent
                                                                              : AppThemeUtils.colorError,
                                                                          width: 1)),
                                                                )),
                                                          )),
                                                     Expanded(
                                                            child: Center(
                                                            child: Container(
                                                                height: 35,
                                                                width: 200,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            10,
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            10,
                                                                        top: 5),
                                                                child:
                                                                    RaisedButton(
                                                                  color: AppThemeUtils
                                                                      .colorPrimary,
                                                                  elevation: 0,
                                                                  onPressed:
                                                                      () {
                                                                    if(positiveCallback != null){
                                                                      positiveCallback();
                                                                    }

                                                                    if (containsPop) {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    }
                                                                  },
                                                                  child: Container(
                                                                      margin: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            0,
                                                                      ),
                                                                      child: AutoSizeText(
                                                                        positiveText ??
                                                                            StringFile.sim,
                                                                        maxLines:
                                                                            multLineButton ??
                                                                                1,
                                                                        minFontSize:
                                                                            12,
                                                                        style: AppThemeUtils
                                                                            .normalBoldSize(
                                                                          color:
                                                                              AppThemeUtils.whiteColor,
                                                                        ),
                                                                      )),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5))),
                                                                )),
                                                          )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))),
                      ]))))),
    );
  }
}

class WidgetDialogGeneric extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Widget description;
  final VoidCallback positiveCallback;
  final VoidCallback negativeCallback;
  final String positiveText;
  final String negativeText;
  final Color color;
  final Color topColor;
  final String subtitle;
  final bool hideSubTitle;
  final bool isLight;
  final bool containsPop;
  final String imagePath;

  WidgetDialogGeneric(
      {this.iconData,
      this.title,
      this.topColor,
      this.description,
      this.positiveCallback,
      this.negativeCallback,
      this.positiveText,
      this.negativeText,
      this.color,
      this.isLight = true,
      this.containsPop = true,
      this.subtitle,
      this.hideSubTitle = true,
      this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width > 435
                  ? 350
                  : MediaQuery.of(context).size.width * 0.8,
              child: Material(
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ListBody(children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 0, bottom: 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              border: Border.all(color: Colors.white, width: 0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                        color: AppThemeUtils.colorPrimary,
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5, bottom: 5, left: 20),
                                          child: imagePath != null
                                              ? Image.asset(
                                                  imagePath,
                                                  height: 60,
                                                  width: 60,
                                                )
                                              : Icon(
                                                  iconData ?? Icons.error,
                                                  color:  AppThemeUtils.whiteColor,
                                                  size: 30,
                                                ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 10,
                                                    right: 10),
                                                child: AutoSizeText(
                                                  title,
                                                  minFontSize: 10,
                                                  maxLines: 1,
                                                  style:
                                                      AppThemeUtils.normalSize(
                                                          color: color ??
                                                              AppThemeUtils
                                                                  .whiteColor,
                                                          fontSize: 22),
                                                ))),
                                      ],
                                    )),
                                Container(
                                  padding: EdgeInsets.only(top: 20, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Flexible(child: description),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 20, bottom: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            negativeCallback == null
                                                ? SizedBox()
                                                : Expanded(
                                                    child: Center(
                                                    child: Container(
                                                        height: 35,
                                                        width: 200,
                                                        margin: EdgeInsets.only(
                                                            right: 10,
                                                            left: 10,
                                                            bottom: 10,
                                                            top: 5),
                                                        child: RaisedButton(
                                                          color: isLight
                                                              ? Colors
                                                                  .transparent
                                                              : AppThemeUtils
                                                                  .colorError,
                                                          elevation: 0,
                                                          onPressed: () {
                                                            negativeCallback();
                                                            if (containsPop) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }
                                                          },
                                                          child: AutoSizeText(
                                                            negativeText ??
                                                                StringFile.nao,
                                                            maxLines: 1,
                                                            minFontSize: 8,
                                                            style: AppThemeUtils
                                                                .normalBoldSize(
                                                              color: isLight
                                                                  ? AppThemeUtils
                                                                      .colorPrimary
                                                                  : AppThemeUtils
                                                                      .whiteColor,
                                                            ),
                                                          ),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                              side: BorderSide(
                                                                  color: isLight
                                                                      ? Colors
                                                                          .transparent
                                                                      : AppThemeUtils
                                                                          .colorError,
                                                                  width: 1)),
                                                        )),
                                                  )),
                                            positiveCallback == null
                                                ? SizedBox()
                                                : Expanded(
                                                    child: Center(
                                                    child: Container(
                                                        height: 35,
                                                        width: 200,
                                                        margin: EdgeInsets.only(
                                                            right: 10,
                                                            left: 10,
                                                            bottom: 10,
                                                            top: 5),
                                                        child: RaisedButton(
                                                          color: AppThemeUtils
                                                              .colorPrimary,
                                                          elevation: 0,
                                                          onPressed: () {
                                                            positiveCallback();
                                                            if (containsPop) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }
                                                          },
                                                          child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 0,
                                                              ),
                                                              child:
                                                                  AutoSizeText(
                                                                positiveText ??
                                                                    StringFile
                                                                        .sim,
                                                                maxLines: 1,
                                                                minFontSize: 8,
                                                                style: AppThemeUtils
                                                                    .normalBoldSize(
                                                                  color: AppThemeUtils
                                                                      .whiteColor,
                                                                ),
                                                              )),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5))),
                                                        )),
                                                  )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ]))))),
    );
  }
}
