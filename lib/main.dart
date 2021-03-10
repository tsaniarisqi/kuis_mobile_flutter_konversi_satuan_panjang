import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Controller
  TextEditingController etInput = TextEditingController();

  // deklarasi variable
  double _inputUser = 0;
  double _centiMeter = 0;
  double _kiloMeter = 0;
  double _meter = 0;
  double _miliMeter = 0;
  String _newValueInput = "Meter";
  String _newValueResult = "Meter";
  double _result = 0;

  // list
  var listItem = {"Centimeter", "Kilometer", "Meter", "Milimeter"};

  void dropdownOnChangedInput(String changeValue) {
    setState(() {
      _newValueInput = changeValue;
      _konversi(); // ketika ada perubahan dropdown, aplikasi dapat memproses tanpa di klik button konversi
    });
  }

  void dropdownOnChangedResult(String changeValue) {
    setState(() {
      _newValueResult = changeValue;
      _konversi(); // ketika ada perubahan dropdown, aplikasi dapat memproses tanpa di klik button konversi
    });
  }

  // fungsi konversi untuk melakukan perhitungan konversi satuan panjang
  void _konversi() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValueInput == "Centimeter") {
        if (_newValueResult == "Kilometer") {
          _result = _inputUser / 100000;
        } else if (_newValueResult == "Meter") {
          _result = _inputUser / 100;
        } else if (_newValueResult == "Milimeter") {
          _result = _inputUser * 10;
        } else {
          _result = _inputUser;
        }
      } else if (_newValueInput == "Kilometer") {
        if (_newValueResult == "Centimeter") {
          _result = _inputUser * 100000;
        } else if (_newValueResult == "Meter") {
          _result = _inputUser * 1000;
        } else if (_newValueResult == "Milimeter") {
          _result = _inputUser * 1000000;
        } else {
          _result = _inputUser;
        }
      } else if (_newValueInput == "Meter") {
        if (_newValueResult == "Centimeter") {
          _result = _inputUser * 100;
        } else if (_newValueResult == "Kilometer") {
          _result = _inputUser / 1000;
        } else if (_newValueResult == "Milimeter") {
          _result = _inputUser * 1000;
        } else {
          _result = _inputUser;
        }
      } else {
        if (_newValueResult == "Centimeter") {
          _result = _inputUser / 10;
        } else if (_newValueResult == "Kilometer") {
          _result = _inputUser / 1000000;
        } else if (_newValueResult == "Meter") {
          _result = _inputUser / 1000;
        } else {
          _result = _inputUser;
        }
      }
    });
  }

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
          backgroundColor: Colors.indigo[300],
          title: Text("Konverter Satuan Panjang"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: etInput,
                decoration: const InputDecoration(
                  hintText: 'Masukkan Angka',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      items: listItem.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _newValueInput,
                      onChanged: (String changeValue) {
                        dropdownOnChanged:
                        dropdownOnChangedInput(changeValue);
                      },
                    ),
                    Text(
                      "Ke",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    DropdownButton<String>(
                      items: listItem.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _newValueResult,
                      onChanged: (String changeValue) {
                        dropdownOnChanged:
                        dropdownOnChangedResult(changeValue);
                      },
                    ),
                  ],
                ),
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
                      "$_result",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    _konversi();
                  },
                  color: Colors.indigo[200],
                  textColor: Colors.white,
                  child: const Text(
                    'Konversi',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
