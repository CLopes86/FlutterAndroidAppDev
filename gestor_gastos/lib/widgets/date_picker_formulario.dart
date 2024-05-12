import 'package:flutter/material.dart';

/// Widget para escolha de data em formulários de transação.
class DatePickerFormField extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  const DatePickerFormField(
      {Key? key, required this.selectedDate, required this.onDateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('Data: '),
          ),
          TextButton(
            onPressed: () => _presentDatePicker(context),
            child: Text('Escolher Data',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) onDateChanged(pickedDate);
    });
  }
}
