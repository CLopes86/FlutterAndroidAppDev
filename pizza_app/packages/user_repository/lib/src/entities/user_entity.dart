// Classe que representa a entidade do usuário usada para persistência de dados.

class MyUserEntity {
  String userId;
  String email;
  String name;
  bool hasActiveCart;

  // Construtor da classe MyUser.
  MyUserEntity(
      {required this.userId,
      required this.email,
      required this.name,
      required this.hasActiveCart});

  // Converte a entidade em um mapa de dados para ser salvo no Firestore.
  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart,
    };
  }

  // Cria uma entidade MyUserEntity a partir de um documento do Firestore.
  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'],
      email: doc['email'],
      name: doc['name'],
      hasActiveCart: doc['hascAtiveCart'],
    );
  }
}
