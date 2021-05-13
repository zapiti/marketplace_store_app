import 'package:flutter/cupertino.dart';
import 'package:marketplace_store_app/app/image/image_path.dart';

class EmptyViewWidget extends StatelessWidget {
  final String text;
  final String imageAsset;

  EmptyViewWidget({@required this.text, @required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Image.asset(imageAsset),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
