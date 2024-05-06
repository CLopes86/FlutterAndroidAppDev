import 'package:flutter/material.dart';
import 'package:projeto1/shared/widgets/texts/text_widget.dart';

class LoadingErrorWidget extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final void Function() loadTodosAndDoneTodos;

  const LoadingErrorWidget(
      {required this.isLoading,
      required this.loadTodosAndDoneTodos,
      this.error,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    error!,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: loadTodosAndDoneTodos,
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.red,
                      ),
                    ),
                    child: const TextWidget("Tentar novamente"),
                  ),
                ],
              ));
  }
}
