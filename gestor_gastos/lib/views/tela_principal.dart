import 'package:flutter/material.dart';
import 'package:gestor_gastos/controllers/transacao_controller.dart';
import 'package:gestor_gastos/widgets/mostar_saldo.dart';
import 'package:gestor_gastos/widgets/transacao_lista.dart';

import 'tela_adcionar_transacao.dart';

/// Classe que representa a tela principal do aplicativo de gestão de gastos.
///
/// Esta tela é responsável por apresentar a interface geral do usuário, incluindo
/// uma barra de navegação e a lista de transações.
class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  //Instancia o controlador de transações que, gerencia a lógica de negocio para transações
  final TransacaoController _controller = TransacaoController();

  @override
  Widget build(BuildContext context) {
    // Scaffold fornece a estrutura básica de layout visual da tela principal.
    return Scaffold(
      // AppBar exibe o título do aplicativo e botões de ação.
      appBar: AppBar(
        title: const Text('Gestão de Gastos'),
        centerTitle: true,
        actions: [
          IconButton(
            // Botão de busca que futuramente permitirá ao usuário filtrar as transações.
            onPressed: () {
              // Implementar funcionalidade de busca
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),

      body: Column(
        // Column organiza os widgets verticalmente.
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Widget customizado para exibir os saldos total e disponível
          MostrarSaldo(controller: _controller),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Lista de Transaçoes'),
          ),
          Expanded(
            // Expanded faz com que o TransacaoLista ocupe todo o espaço restante na coluna.
            child: TransacaoLista(
              // TransacaoLista é um widget customizado que exibe a lista de transações.
              transacoes: _controller
                  .transacoes, // Passa a lista de transações do controlador.
              controller:
                  _controller, // Passa o próprio controlador para gerenciar ações.
            ),
          )
        ],
      ),

      // Botão flutuante para adicionar novas transações.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navega para a tela de adcionar nova transação
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    TelaAdcionarTransacao(controller: _controller)),
          );
        },
        tooltip: 'Adcionar Transação',
        child: const Icon(Icons.add),
      ),
    );
  }
}
