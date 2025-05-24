import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_marketplace_app/app/utils/image_utils.dart';
import 'package:new_marketplace_app/app/utils/theme/app_theme_utils.dart';

class UserImageWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final bool isRounded;

  final Function(String?)? changeImage;
  final String? userImage;
  final String? addButtom;
  final bool enable;

  UserImageWidget({
    this.height,
    this.width,
    this.isRounded = true,
    this.changeImage,
    this.userImage,
    this.addButtom,
    this.enable = true,
  });

  @override
  _UserImageWidgetState createState() => _UserImageWidgetState();
}

class _UserImageWidgetState extends State<UserImageWidget> {
  final ImagePicker _picker = ImagePicker();
  File? _images;
  Image? _image;
  String? _base64;

  _onImageButtonPressed(ImageSource source, {bool singleImage = false}) async {
    var pickedFile;
    File? photo2;
    try {
      pickedFile = await ImagePicker().pickImage(
          source: source, maxWidth: 300, maxHeight: 300);

      if (pickedFile != null) {
        photo2 = File(pickedFile.path);
      }
    } catch (e) {
      print(e);
    }

    if (photo2 != null) {

        final bytes = await photo2.readAsBytes();

        String img64 = base64Encode(bytes);
        salvarImage(img64);

    }
    if (_base64 != null) {
      salvarImage(_base64);
    }
  }

  void salvarImage(String? img64) {
    debugPrint(img64);
    widget.changeImage?.call(img64);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.camera_alt),
                title: new Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                  _onImageButtonPressed(ImageSource.camera);
                },
              ),
              new ListTile(
                leading: new Icon(Icons.photo_library),
                title: new Text("Galeria"),
                onTap: () {
                  Navigator.of(context).pop();
                  _onImageButtonPressed(ImageSource.gallery, singleImage: true);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 120,
      height: widget.height ?? 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.isRounded ? 100.0 : 0),
        child: Container(
          color: Colors.grey[200],
          child: InkWell(
            onTap: !widget.enable
                ? null
                : () {
                    _settingModalBottomSheet(context);
                  },
            child: Stack(
              children: <Widget>[
                _images == null
                    ? Center(
                        child: widget.userImage == null
                            ? Center(
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                ),
                              )
                            : (widget.userImage ?? "").isEmpty
                                ? SizedBox()
                                : ImageUtils.imageFromBase64String(
                                    (widget.userImage ?? ""),
                                    fit: BoxFit.cover,

                                    width: widget.width ?? 120,
                                    height: widget.height ?? 120,
                                    //
                                    // placeholder: (context, url) =>
                                    //     new CircularProgressIndicator(),
                                    // errorWidget:
                                    //     (context, url, error) =>
                                    //         new Icon(
                                    //   Icons.person,
                                    //   size: 60,
                                    // ),
                                  ),
                      )
                    : _images == null
                        ? SizedBox()
                        : Image.file(
                            _images!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                !widget.isRounded || !widget.enable
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Opacity(
                          opacity: 0.7,
                          child: Container(
                            color: Colors.white,
                            width: 200,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                widget.addButtom == null
                    ? SizedBox()
                    : Center(
                        child: Opacity(
                          opacity: 0.6,
                          child: ElevatedButton(
                            child: Text(
                              widget.addButtom ?? '',
                              style:
                                  AppThemeUtils.normalSize(color: Colors.white),
                            ),
                            onPressed: !widget.enable
                                ? null
                                : () {
                                    _settingModalBottomSheet(context);
                                  },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey, elevation: 0),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
