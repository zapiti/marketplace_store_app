import 'package:flutter/material.dart';

class SimpleLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColorLight),
        strokeWidth: 4,
      ),
    );
  }
}
