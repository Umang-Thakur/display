import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Container(child: CircularProgressIndicator(), width: 15, height: 15),
    );
  }
}
