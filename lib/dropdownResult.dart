import 'package:flutter/material.dart';

class DropdownButtonResult extends StatelessWidget {
  const DropdownButtonResult({
    Key key,
    @required this.listItem,
    @required String newValueResult,
    @required this.dropdownOnChangedResult,
  })  : _newValueResult = newValueResult,
        super(key: key);

  final Set<String> listItem;
  final String _newValueResult;
  final Function dropdownOnChangedResult;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      // String untuk memberi tipe data value dari dropdown adalah
      // bertipe sting
      items: listItem.map((String value) {
        // ListItem.map ((String(value) untuk melakukan iterasi untuk
        // setiap item dari listItem sesuai parameter bertipe String
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      // .toList() untuk mengubah item ke dalam list
      value: _newValueResult,
      // value:_newValueResult untuk mengeset value pada DropdownButton
      // secara default
      onChanged: (String changeValue) {
        // ketika user melakukan perubahan pada dropdownButton, maka akan
        // memanggil fungsi dropdownOnChangedResult
        dropdownOnChanged:
        dropdownOnChangedResult(changeValue);
      },
    );
  }
}
