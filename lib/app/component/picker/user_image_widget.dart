import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketplace_entregador/app/component/builder/builder_component.dart';
import 'package:marketplace_entregador/app/utils/theme/app_theme_utils.dart';


class UserImageWidget extends StatefulWidget {
  final double height;
  final double width;
  final bool isRounded;

  final Function(String) changeImage;
  final Stream userImage;
  final String addButtom;

  UserImageWidget({
    this.height,
    this.width,this.isRounded = true,

    this.changeImage,
    this.userImage, this. addButtom,
  });

  @override
  _UserImageWidgetState createState() => _UserImageWidgetState();
}

class _UserImageWidgetState extends State<UserImageWidget> {
  final ImagePicker _picker = ImagePicker();
  File _images;
  Image _image;
  String _base64;

  _onImageButtonPressed(ImageSource source, {bool singleImage = false}) async {
    var pickedFile;
    File photo2;
    try {
      pickedFile = await ImagePicker.pickImage(
          source: source, maxWidth: 300, maxHeight: 300);

      photo2 = File(pickedFile.path);
    } catch (e) {
      print(e);
    }

    if (photo2 != null) {
      File photo = await ImageCropper.cropImage(
          sourcePath: photo2.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cortar',
              toolbarColor: AppThemeUtils.colorPrimary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
      if (photo != null) {
        final bytes = photo.readAsBytesSync();

        String img64 = base64Encode(bytes);
        salvarImage(img64, photo);
      }
    }
    if (_base64 != null) {
      salvarImage(_base64, null);
    }
  }

  void salvarImage(String img64, File photo) {
    widget.changeImage(img64);
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
                      _onImageButtonPressed(ImageSource.gallery,
                          singleImage: true);
                    }),
              ],
            ),
          );
        });
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
                    onTap: kIsWeb
                        ? null
                        : () {
                            _settingModalBottomSheet(context);
                          },
                    child: Stack(children: <Widget>[
                      widget.addButtom == null ? SizedBox():    Center(
                child:Opacity(opacity: 0.6,child:   ElevatedButton(
                        child: Text(
                         widget.addButtom,
                          style: AppThemeUtils.normalSize(color: Colors.white),
                        ),
                        onPressed: (){
                          _settingModalBottomSheet(context);
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.grey,elevation: 0),
                      ))),
                      _images == null
                          ? builderComponent<String>(
                              stream: widget.userImage,
                              enableLoad: false,
                              initCallData: () {},
                              buildBodyFunc: (context, response) => Center(
                                  child: response == null
                                      ? Center(
                                          child: Icon(
                                          Icons.person,
                                          size: 60,
                                        ))
                                      : (response ?? "").isEmpty ? SizedBox():Image.network(
                                    (response ?? ""), fit: BoxFit.fill,

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
                                        )))
                          : _images == null
                              ? SizedBox()
                              : Image.file(
                                  _images,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                      !widget.isRounded ? SizedBox()
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
                                  ))),
                    ])))));
  }
}
