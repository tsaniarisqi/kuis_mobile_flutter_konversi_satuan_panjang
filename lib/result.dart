import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required double result,
  }) : _result = result, super(key: key);

  final double _result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "$_result",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
