import 'package:flutter/material.dart';

class NamaInputWidget extends StatelessWidget {
  final String? nama;
  final ValueChanged<String> onChanged;

  const NamaInputWidget({super.key, required this.nama, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nama',
          ),
          onChanged: onChanged,
        ),
        const SizedBox(height: 5),
        Text(nama == null ? "Belum ada input nama" : "Nama: $nama"),
      ],
    );
  }
}
