import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;

  const ErrorPage({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        this.message,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}
