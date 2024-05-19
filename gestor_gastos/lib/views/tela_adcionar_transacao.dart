import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';
import 'package:gestor_gastos/models/transacao.dart';
import 'package:gestor_gastos/widgets/data_formatado.dart';
import 'package:gestor_gastos/widgets/formulario.dart';
import 'package:provider/provider.dart';

/// Tela para adicionar uma nova transação.
/// Permite ao usuário inserir detalhes de uma nova transação, incluindo título, valor e data.
class TelaAdicionarTransacao extends StatefulWidget {
  final TransacaoController controller;
  final Transacao? transacao;

  /// Construtor que recebe [controller] para manipulação de dados.
  const TelaAdicionarTransacao(
      {super.key, required this.controller, this.transacao});

  @override
  State<TelaAdicionarTransacao> createState() => _TelaAdicionarTransacaoState();
}

class _TelaAdicionarTransacaoState extends State<TelaAdicionarTransacao> {
  final _chaveFormulario = GlobalKey<FormState>();
  final _tituloTec = TextEditingController();
  final _quantiaTec = TextEditingController();
  final _dataTec = TextEditingController();
  late DateTime _transacaoData;

  @override
  void initState() {
    super.initState();
    if ((widget.transacao != null)) {
      _tituloTec.text = widget.transacao!.titulo;
      _quantiaTec.text = widget.transacao!.quantia.toString();
      _dataTec.text = widget.transacao!.data.formatDate;
      _transacaoData = widget.transacao!.data;
    } else {
      _transacaoData = DateTime.now();
    }
  }

  // Libera os recursos quando o widget for descartado.
  @override
  void dispose() {
    _tituloTec.dispose();
    _quantiaTec.dispose();
    _dataTec.dispose();
    super.dispose();
  }

// Método para adicionar uma nova transação.
  Future<void> _adicionarTransacao() async {
    if (_chaveFormulario.currentState!.validate()) {
      final transacaoCtrl =
          Provider.of<TransacaoController>(context, listen: false);

      double quantia = double.tryParse(_quantiaTec.text) ?? 0.0;

      // Cria a nova transação.
      final novaTransacao = Transacao(
        id: widget.transacao?.id ?? DateTime.now().toString(),
        titulo: _tituloTec.text,
        quantia: quantia,
        data: _transacaoData,
      );

      try {
        await transacaoCtrl.adicionarTransacao(novaTransacao);

        if (context.mounted) {
          Navigator.of(context).pop();
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao adicionar transação: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar transação'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Form(
            key: _chaveFormulario, // Associa a chave do formulário.
            child: Column(
              children: [
                // Campo para entrada do título da transação usando EditarFormulario.

                EditarFormulario(
                  controller: _tituloTec,
                  focusNode: FocusNode(),
                  label: 'Título',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um título';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Campo para entrada da quantia da transação usando EditarFormulario.
                EditarFormulario(
                  controller: _quantiaTec,
                  focusNode: FocusNode(),
                  label: 'Quantia',
                  keyboardType:
                      TextInputType.number, // Define o tipo de teclado.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma quantia';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor, insira um número válido';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16), // Espaçamento entre campos.
                // Campo para entrada da data da transação usando EditarFormulario.

                EditarFormulario(
                  controller: _dataTec,
                  focusNode: FocusNode(),
                  label: 'Data',
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    // Abre o seletor de data quando o campo for selecio.
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        _transacaoData =
                            pickedDate; // Atualiza a data da transação.
                        _dataTec.text =
                            pickedDate.formatDate; // Exibe a data no campo.
                      });
                    }
                  },
                  readOnly: true, // Define o campo como somente leitura.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, selecione uma data'; // Validação do campo.
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16), // Espaçamento entre campos.

                // Botão para adicionar a transação.
                ElevatedButton(
                  onPressed: _adicionarTransacao,
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
