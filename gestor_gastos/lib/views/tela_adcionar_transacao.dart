import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';
import 'package:gestor_gastos/models/transacao.dart';
import 'package:gestor_gastos/widgets/titulo_formulario.dart';
import 'package:gestor_gastos/widgets/valor_formulario.dart';

import '../widgets/date_picker_formulario.dart';
import '../widgets/salvar_Botao.dart';

/// Tela para adicionar uma nova transação.
/// Permite ao usuário inserir detalhes de uma nova transação, incluindo título, valor e data.
class TelaAdcionarTransacao extends StatefulWidget {
  final TransacaoController controller;

  /// Construtor que recebe [controller] para manipulação de dados.
  const TelaAdcionarTransacao({super.key, required this.controller});

  @override
  State<TelaAdcionarTransacao> createState() => _TelaAdcionarTransacaoState();
}

class _TelaAdcionarTransacaoState extends State<TelaAdcionarTransacao> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Chave global para o formulário para validação.
  late String titulo; //Armazena o titulo da nova transação
  late double valor; //Armazena o valor da nova transação
  DateTime dataSelecionada =
      DateTime.now(); // Armazena a data selecionada, inicialmente hoje.

  /// Apresenta um seletor de data ao usuário.
  void presentDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).then((pickeddate) {
      if (pickeddate == null) return;
      setState(() {
        dataSelecionada = pickeddate; // Atualiza a data selecionada.
      });
    });
  }

  /// Método para salvar a nova transação se o formulário estiver válido.
  void salvarFormulario() {
    if (_formKey.currentState!.validate()) {
      // Verifica se todos os campos do formulário estão válidos.
      _formKey.currentState!.save(); // Salva o estado atual do formulário.
      final novaTransacao = Transacao(
        id: DateTime.now().toString(),
        titulo: titulo,
        quantia: valor,
        data: dataSelecionada,
      );
      widget.controller.adcionarTransacao(
          novaTransacao); // Adiciona a nova transação através do controlador.
      Navigator.of(context)
          .pop(); // Fecha a tela de adicionar transação e retorna para a tela anterior.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adcionar Transacao'),
      ),
      body: Form(
        key: _formKey, // Associa a chave do formulário.
        child: SingleChildScrollView(
          // Permite a rolagem da tela, útil para formulários longos.
          child: Column(
            children: <Widget>[
              TituloFormulario(onSaved: (value) => titulo = value),
              ValorFormField(onSaved: (value) => valor = double.parse(value)),
            ],
          ),
        ),

        // Conteúdo para adicionar uma nova transação...
      ),
    );
  }
}
