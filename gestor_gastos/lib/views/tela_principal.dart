import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';
import 'package:gestor_gastos/widgets/transacao_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/transacao.dart';
import '../widgets/mostar_saldo.dart';
import '../widgets/texto_stilo.dart';
import 'tela_adcionar_transacao.dart';

/// Classe que representa a tela principal do aplicativo de gestão de gastos.

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    final TransacaoController _controller =
        Provider.of<TransacaoController>(context, listen: true);
    final NumberFormat currencyFormat =
        NumberFormat.simpleCurrency(locale: 'pt_PT', name: 'EUR');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestão de Gastos'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          MostrarSaldo(controller: _controller),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextoStyle(
              'Transações',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _controller.transacoes
                  .length, // Usa o controlador para obter o tamanho da lista
              itemBuilder: (_, int index) {
                final Transacao transacao = _controller.transacoes[
                    index]; // Usa o controlador para obter as transações
                return Card(
                  elevation: 3, // Sombra do card
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(
                      transacao.titulo,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        TransacaoData(transacao: transacao),
                        const SizedBox(height: 5),
                        TextoStyle(
                          currencyFormat.format(transacao.quantia),
                          // Formatação de moeda
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            // Navega para a tela de edição com a transação selecionada
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TelaAdicionarTransacao(
                                  controller: _controller,
                                  transacao: transacao,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Remove a transação
                            _controller.removerTransacao(transacao);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navega para a tela de adicionar nova transação
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  TelaAdicionarTransacao(controller: _controller),
            ),
          );
        },
        tooltip: 'Adicionar Transação',
        child: const Icon(Icons.add),
      ),
    );
  }
}
