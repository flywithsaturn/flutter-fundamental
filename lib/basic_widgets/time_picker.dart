import 'package:flutter/material.dart';

class TimePickerWidget extends StatelessWidget {
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const TimePickerWidget({
    super.key,
    required this.selectedTime,
    required this.onTimeChanged,
  });

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      onTimeChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Jam dipilih: ${selectedTime.format(context)}"),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () => _selectTime(context),
          child: const Text("Pilih Jam"),
        ),
      ],
    );
  }
}
