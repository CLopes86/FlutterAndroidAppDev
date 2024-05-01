# Projeto de Lista de Tarefas

Este é um aplicativo de Lista de Tarefas desenvolvido com Flutter, que permite aos usuários gerenciar suas tarefas diárias de forma eficiente. O aplicativo suporta a criação, edição e exclusão de tarefas, além de oferecer funcionalidades de persistência de dados com segurança.

## Funcionalidades

- **Adicionar Tarefas:** Os usuários podem adicionar tarefas à lista com um título e uma descrição opcional.
- **Editar Tarefas:** As tarefas podem ser editadas a qualquer momento.
- **Excluir Tarefas:** Permite a exclusão de tarefas indesejadas.
- **Persistência de Dados:** As tarefas são salvas localmente no dispositivo, utilizando `flutter_secure_storage` para segurança.

## Tecnologias Utilizadas

- **Flutter:** Este projeto é construído usando a versão mais recente do Flutter.
- **Dart:** Toda a lógica de negócios é implementada em Dart.
- **Flutter Secure Storage:** Usado para armazenar dados de forma segura no dispositivo.

## Estrutura do Projeto

O projeto está dividido nas seguintes pastas principais:

- `lib/`: Contém todo o código fonte do aplicativo.
- `lib/models/`: Definições de modelos de dados.
- `lib/views/`: Telas e componentes visuais do aplicativo.
- `lib/services/`: Serviços de lógica de negócios, incluindo manipulação de armazenamento local.
- `lib/shared/`: Componentes e funções compartilhados em todo o aplicativo.
