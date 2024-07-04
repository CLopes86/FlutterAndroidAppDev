// Classe que representa um usuário na aplicação.
import 'package:user_repository/src/entities/entities.dart';

class MyUser {
  String userId;
  String email;
  String name;
  bool hasActiveCart;

  // Construtor da classe MyUser.
  MyUser(
      {required this.userId,
      required this.email,
      required this.name,
      required this.hasActiveCart});

  // Instância estática que representa um usuário vazio.
  static final empty = MyUser(
    userId: '',
    email: '',
    name: '',
    hasActiveCart: false,
  );

  // Converte um MyUser em uma entidade MyUserEntity.
  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      hasActiveCart: hasActiveCart,
    );
  }

  // Constrói um MyUser a partir de uma entidade MyUserEntity.
  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      name: entity.name,
      hasActiveCart: entity.hasActiveCart,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'MyUser: $userId, $email, $name, $hasActiveCart';
  }
}
