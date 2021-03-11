import 'package:flutter/material.dart';

class RiwayatKonversi extends StatelessWidget {
  const RiwayatKonversi({
    Key key,
    @required this.listViewItem,
  }) : super(key: key);

  final List<String> listViewItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: ListView(
        // listView widget untuk menampilan data dalam bentuk list
        children: listViewItem.map((String value) {
          // menampilkan hail listViewItem menggunakan map
          return Container(
              margin: EdgeInsets.all(10),
              child: Text(
                value,
                style: TextStyle(fontSize: 15),
              ));
        }).toList(),
        // .toList() untuk mengubah item ke dalam list
      ),
    );
  }
}
