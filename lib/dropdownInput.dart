import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropdownButtonInput extends StatelessWidget {
  const DropdownButtonInput({
    Key key,
    @required this.listItem,
    @required String newValueInput,
    @required this.dropdownOnChangedInput,
  }) : _newValueInput = newValueInput, super(key: key);

  final Set<String> listItem;
  final String _newValueInput;
  final Function dropdownOnChangedInput;

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
      value: _newValueInput,
      // value: _newValueInput untuk mengeset value pada DropdownButton
      // secara default
      onChanged: (String changeValue) {
        // ketika user melakukan perubahan pada dropdownButton,maka akan
        // memanggil fungsi dropdownOnChangedInput
        dropdownOnChanged:
        dropdownOnChangedInput(changeValue);
      },
    );
  }
}