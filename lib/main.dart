import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input.dart';
import 'dropdownInput.dart';
import 'dropdownResult.dart';
import 'result.dart';
import 'convert.dart';
import 'riwayatKonversi.dart';
import 'deleteRiwayatKonversi.dart';

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
  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();

  // list
  var listItem = {"Centimeter", "Kilometer", "Meter", "Milimeter"};

  // fungsi dropdownOnChangedInput digunakan ketika user melakukan perubahan pada dropdownButton
  void dropdownOnChangedInput(String changeValue) {
    setState(() {
      _newValueInput = changeValue;
    });
  }

  // fungsi dropdownOnChangedResult digunakan ketika user melakukan perubahan pada dropdownButton
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
      // untuk menampilkan hasil riwayat
      listViewItem
          .add("$_inputUser $_newValueInput = $_result $_newValueResult");
    });
  }

  // fungsi untuk menghapus riwayat konversi
  void _deleteRiwayat() {
    setState(() {
      listViewItem.clear();
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
              Input(etInput: etInput),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      // Margin untuk megatur jarak container dengan widget lainnya
                      // (hanya bagian kanan sebesar 15)
                      child: DropdownButtonInput(
                          listItem: listItem,
                          newValueInput: _newValueInput,
                          dropdownOnChangedInput: dropdownOnChangedInput),
                    ),
                    Container(
                      // Margin untuk megatur jarak container dengan widget lainnya
                      // (hanya bagian kanan dan kiri sebesar 20)
                      margin: EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        "->",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                        // textStyle untuk mengatur style dari text
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      // Margin untuk megatur jarak container dengan widget lainnya
                      // (hanya bagian kiri sebesar 15)
                      child: DropdownButtonResult(
                          listItem: listItem,
                          newValueResult: _newValueResult,
                          dropdownOnChangedResult: dropdownOnChangedResult),
                    ),
                  ],
                ),
              ),
              Result(result: _result),
              Convert(konvertHandler: _konversi),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: RiwayatKonversi(listViewItem: listViewItem),
              ),
              DeleteRiwayatKonversi(deleteHistory: _deleteRiwayat),
            ],
          ),
        ),
      ),
    );
  }
}
