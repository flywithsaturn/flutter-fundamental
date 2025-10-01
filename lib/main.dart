import 'package:flutter/material.dart';
import 'basic_widgets/nama_input.dart';
import 'basic_widgets/date_picker.dart';
import 'basic_widgets/time_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? nama;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void _incrementCounter() => setState(() => _counter++);

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
              setState(() => _counter = 0);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _showSimpleDialog() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("Pilih opsi"),
        children: [
          SimpleDialogOption(
            onPressed: () {
              setState(() => _counter += 5);
              Navigator.pop(context);
            },
            child: const Text("Tambah 5"),
          ),
          SimpleDialogOption(
            onPressed: () {
              setState(() => _counter += 10);
              Navigator.pop(context);
            },
            child: const Text("Tambah 10"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('You have pushed the button this many times:',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),

            // Nama Input
            NamaInputWidget(
              nama: nama,
              onChanged: (val) => setState(() => nama = val),
            ),
            const SizedBox(height: 20),

            // Date Picker
            DatePickerWidget(
              selectedDate: selectedDate,
              onDateChanged: (val) => setState(() => selectedDate = val),
            ),
            const SizedBox(height: 20),

            // Time Picker
            TimePickerWidget(
              selectedTime: selectedTime,
              onTimeChanged: (val) => setState(() => selectedTime = val),
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
      bottomNavigationBar: BottomAppBar(child: Container(height: 50)),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
