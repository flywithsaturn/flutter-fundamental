import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Root aplikasi
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Input Widget',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyHomePage(title: 'Demo Input & Selection Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? nama;

  // Variabel untuk Date & Time Picker
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Fungsi menampilkan AlertDialog
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi"),
          content: const Text("Apakah kamu yakin ingin reset counter?"),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("Reset"),
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // Fungsi menampilkan SimpleDialog
  void _showSimpleDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Pilih opsi"),
          children: [
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  _counter += 5;
                });
                Navigator.pop(context);
              },
              child: const Text("Tambah 5"),
            ),
            SimpleDialogOption(
              onPressed: () {
                setState(() {
                  _counter += 10;
                });
                Navigator.pop(context);
              },
              child: const Text("Tambah 10"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Fungsi Time Picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 20),

              // TextField input
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama',
                ),
                onChanged: (val) {
                  setState(() {
                    nama = val;
                  });
                },
              ),
              const SizedBox(height: 10),
              Text(nama == null ? "Belum ada input nama" : "Nama: $nama"),

              const SizedBox(height: 20),

              // Date Picker
              Text("Tanggal dipilih: ${selectedDate.toLocal()}".split(' ')[0]),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text("Pilih Tanggal"),
              ),

              const SizedBox(height: 20),

              // Time Picker
              Text("Jam dipilih: ${selectedTime.format(context)}"),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: const Text("Pilih Jam"),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _showAlertDialog,
                child: const Text("Show AlertDialog"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _showSimpleDialog,
                child: const Text("Show SimpleDialog"),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
