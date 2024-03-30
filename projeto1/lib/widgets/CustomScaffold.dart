import 'package:flutter/material.dart';

/// Widget que personaliza um Scaffold com uma imagem de fundo.
class CustomScaffold extends StatelessWidget {
  /// Construtor para o widget CustomScaffold.
  const CustomScaffold({Key? key, this.child}) : super(key: key);

  /// Widget filho a ser exibido em cima da imagem de fundo.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Configuração da barra de aplicativos.
        iconTheme: const IconThemeData(
          color: Colors.white,
        ), // Define a cor dos ícones na barra de aplicativos.
        backgroundColor: Colors
            .transparent, // Define a cor de fundo da barra de aplicativos como transparente.
        elevation: 0, // Remove a sombra da barra de aplicativos.
      ),
      extendBodyBehindAppBar:
          true, // Permite que o corpo seja estendido atrás da barra de aplicativos.
      body: Stack(
        // Widget Stack para empilhar a imagem de fundo e o widget filho.
        children: [
          Image.asset(
            // Configuração da imagem de fundo.
            'imagens/img1.jpg', // Caminho do recurso da imagem.
            fit: BoxFit
                .cover, // Define como a imagem deve ser ajustada dentro do contêiner.
            width: double
                .infinity, // Define a largura da imagem para corresponder à largura da tela.
            height: double
                .infinity, // Define a altura da imagem para corresponder à altura da tela.
          ),
          SafeArea(
            // Widget SafeArea para garantir que o widget filho seja exibido abaixo da barra de status.
            child: child!, // Widget filho exibido em cima da imagem de fundo.
          ),
        ],
      ),
    );
  }
}
