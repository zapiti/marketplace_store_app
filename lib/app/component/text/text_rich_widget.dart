import 'package:flutter/material.dart';

class TextRichWidget extends StatelessWidget {
  final String? richText;
  final String? normalText;

  TextRichWidget({this.richText, this.normalText});

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: <TextSpan>[
      new TextSpan(
        text: '\$8.99',
        style: new TextStyle(
          color: Colors.grey,
          decoration: TextDecoration.lineThrough,
        ),
      ),
    ]));
    //
    // return Text.rich(
    //   TextSpan(
    //     text: 'This item costs ',
    //     children: <TextSpan>[
    //       new TextSpan(
    //         text: '\$8.99',
    //         style: new TextStyle(
    //           color: Colors.grey,
    //           decoration: TextDecoration.lineThrough,
    //         ),
    //       ),
    //       new TextSpan(
    //         text: ' \$3.99',
    //       ),
    //     ],
    //   ),
    // );
  }
}
