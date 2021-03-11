import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: etInput,
      decoration: const InputDecoration(
        hintText: 'Masukkan Angka',
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      // Tampilan input keyboard hanya angka dan memperbolehkan desimal
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
        // memperbolehkan angka dari 0 sampai 9 dan koma
      ],
    );
  }
}
