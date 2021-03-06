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
  String _newValueInput = "Meter";
  String _newValueResult = "Centimeter";
  double _result = 0;
  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();

  // list
  var listItem = {"Centimeter", "Kilometer", "Meter", "Milimeter"};

  // fungsi dropdownOnChangedInput digunakan ketika user melakukan perubahan pada dropdownButtonInput
  void dropdownOnChangedInput(String changeValue) {
    setState(() {
      _newValueInput = changeValue;
    });
  }

  // fungsi dropdownOnChangedResult digunakan ketika user melakukan perubahan pada dropdownButtonResult
  void dropdownOnChangedResult(String changeValue) {
    setState(() {
      _newValueResult = changeValue;
      _konversi(); // ketika ada perubahan dropdown, aplikasi dapat memproses tanpa di klik button konversi
    });
  }

  // fungsi konversi untuk melakukan perhitungan konversi satuan panjang
  void _konversi() {
    setState(() {
      // mengubah string ke double
      _inputUser = double.parse(etInput.text);
      // jika dropdownInput yang dipilih = centimeter, maka kondisi ini terpenuhi
      if (_newValueInput == "Centimeter") {
        // jika dropdownResult yang dipilih = Kilometer, maka kondisi ini terpenuhi.
        if (_newValueResult == "Kilometer") {
          _result = _inputUser / 100000;
        }
        // jika dropdownResult yang dipilih = Meter, maka kondisi ini terpenuhi.
        else if (_newValueResult == "Meter") {
          _result = _inputUser / 100;
        }
        // jika dropdownResult yang dipilih = Milimeter, maka kondisi ini terpenuhi.
        else if (_newValueResult == "Milimeter") {
          _result = _inputUser * 10;
        }
        // kondisi ini terpenuhi jika dropdownResult yang dipilih tidak memenuhi
        // kondisi diatas/sisa dari listItem, yaitu Centimeter
        else {
          _result = _inputUser;
        }
      }
      // jika dropdownInput yang dipilih = Kilometer, maka kondisi ini terpenuhi
      else if (_newValueInput == "Kilometer") {
        // jika dropdownResult yang dipilih = Centimeter, maka kondisi ini terpenuhi.
        if (_newValueResult == "Centimeter") {
          _result = _inputUser * 100000;
        }
        // jika dropdownResult yang dipilih = Meter, maka kondisi ini terpenuhi.
        else if (_newValueResult == "Meter") {
          _result = _inputUser * 1000;
        }
        // jika dropdownResult yang dipilih = Milimeter, maka kondisi ini terpenuhi.
        else if (_newValueResult == "Milimeter") {
          _result = _inputUser * 1000000;
        }
        // kondisi ini terpenuhi jika dropdownResult yang dipilih tidak memenuhi
        // kondisi diatas/sisa dari listItem, yaitu Kilometer
        else {
          _result = _inputUser;
        }
      }
      // jika dropdownInput yang dipilih = Meter, maka kondisi ini terpenuhi
      else if (_newValueInput == "Meter") {
        // jika dropdownResult yang dipilih = Centimeter, maka kondisi ini terpenuhi.
        if (_newValueResult == "Centimeter") {
          _result = _inputUser * 100;
        }
        // jika dropdownResult yang dipilih = Kilometer, maka kondisi ini terpenuhi.
        else if (_newValueResult == "Kilometer") {
          _result = _inputUser / 1000;
        }
        // jika dropdownResult yang dipilih = Milimeter, maka kondisi ini terpenuhi.
        else if (_newValueResult == "Milimeter") {
          _result = _inputUser * 1000;
        }
        // kondisi ini terpenuhi jika dropdownResult yang dipilih tidak memenuhi
        // kondisi diatas/sisa dari listItem, yaitu Meter
        else {
          _result = _inputUser;
        }
      }
      // kondisi ini terpenuhi jika dropdownInput yang dipilih tidak memenuhi
      // kondisi diatas/sisa dari listItem, yaitu Milimeter
      else {
        // jika dropdownResult yang dipilih = Centimeter, maka kondisi ini terpenuhi.
        if (_newValueResult == "Centimeter") {
          _result = _inputUser / 10;
        }
        // jika dropdownResult yang dipilih = Kilometer, maka kondisi ini terpenuhi.
        else if (_newValueResult == "Kilometer") {
          _result = _inputUser / 1000000;
        }
        // jika dropdownResult yang dipilih = Meter, maka kondisi ini terpenuhi.
        else if (_newValueResult == "Meter") {
          _result = _inputUser / 1000;
        }
        // kondisi ini terpenuhi jika dropdownResult yang dipilih tidak memenuhi
        // kondisi diatas/sisa dari listItem, yaitu Milimeter
        else {
          _result = _inputUser;
        }
      }
      // untuk menampilkan hasil riwayat
      listViewItem
          .add("$_inputUser $_newValueInput = $_result $_newValueResult");
    });
  }

  // fungsi deleteRiwayat untuk menghapus riwayat konversi
  void _deleteRiwayat() {
    setState(() {
      listViewItem.clear();
      // .clear untuk me-remove semua isi dari listViewItem
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
