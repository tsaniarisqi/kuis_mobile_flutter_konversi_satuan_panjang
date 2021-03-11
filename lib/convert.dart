import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  const Convert({Key key, @required this.konvertHandler}) : super(key: key);

  final Function konvertHandler;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: konvertHandler,
        // ketika button ditekan, maka akan memanggil fungsi konverHandler
        color: Colors.indigo[200],
        textColor: Colors.white,
        child: const Text(
          'Konversi',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
