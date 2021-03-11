import 'package:flutter/material.dart';

class DeleteRiwayatKonversi extends StatelessWidget {
  const DeleteRiwayatKonversi({
    Key key,
    @required this.deleteHistory,
  }) : super(key: key);

  final Function deleteHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        // ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: deleteHistory,
          // ketika button ditekan, maka akan memanggil fungsi deleteHistory
          color: Colors.indigo[200],
          textColor: Colors.white,
          child: const Text(
            'Hapus Riwayat',
            style:
                TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
