import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[200],
          title: Text("Konverter Satuan Panjang"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Masukkan Angka',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hasil",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      ""
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
