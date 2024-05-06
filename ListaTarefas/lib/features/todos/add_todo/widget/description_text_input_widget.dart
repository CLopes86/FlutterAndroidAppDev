import 'package:flutter/material.dart';
import 'package:projeto1/shared/widgets/texts/inputs/text_input_widget.dart';

class DescriptionTextInputWidget extends StatelessWidget {
  final TextEditingController descriptionTEc;
  final FocusNode descriptionFN;
  final FocusNode todoDateFN;

  const DescriptionTextInputWidget({
    required this.descriptionTEc,
    required this.descriptionFN,
    required this.todoDateFN,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      controller: descriptionTEc,
      focusNode: descriptionFN,
      label: 'Descrição',
      minLines: 4,
      maxLines: 6,
      textCapitalization: TextCapitalization.sentences,
      onFieldSubmitted: (_) => todoDateFN.requestFocus(),
    );
  }
}
