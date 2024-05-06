import 'package:flutter/material.dart';
import 'package:projeto1/shared/exetensions/date_extension.dart';
import 'package:projeto1/shared/widgets/texts/inputs/text_input_widget.dart';

class DateTextInputWidget extends StatelessWidget {
  final TextEditingController todoDateTEC;
  final FocusNode todoDateFN;

  final void Function(DateTime date) setDate;

  const DateTextInputWidget({
    required this.todoDateTEC,
    required this.todoDateFN,
    required this.setDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: todoDateTEC,
      focusNode: todoDateFN,
      label: 'Data',
      validator: (String? newTodoDate) {
        if (newTodoDate == null || newTodoDate.isEmpty) {
          return 'Tens que adcionar uma data a Tarefa ';
        }

        return null;
      },
      textInputAction: TextInputAction.search,
      readOnly: true,
      onTap: () async {
        final DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(
            const Duration(days: 365 * 100),
          ),
        );
        String stringDate = '';
        if (date != null) {
          setDate(date);
          stringDate = date.formatDate;
        }
        todoDateTEC.text = stringDate;
      },
    );
  }
}
