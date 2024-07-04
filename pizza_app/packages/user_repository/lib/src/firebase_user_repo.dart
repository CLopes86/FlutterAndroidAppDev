import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/transformers.dart';
import 'package:user_repository/user_repository.dart';

// Classe que implementa a interface UserRepository usando Firebase.
class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth
      _firebaseAuth; // Instância do FirebaseAuth para gerenciar a autenticação.
  final usersCollection = FirebaseFirestore.instance
      .collection('users'); // Referência à coleção 'users' no Firestore.

  // Construtor da classe, permitindo a injeção de dependência do FirebaseAuth.
  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // Stream que emite o usuário atual ou um usuário vazio se não estiver autenticado
  @override
  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async* {
      if (firebaseUser == null) {
        yield MyUser
            .empty; // Emite um usuário vazio se não houver usuário autenticado.
      } else {
        // Busca os dados do usuário no Firestore e emite um objeto MyUser.
        yield await usersCollection.doc(firebaseUser.uid).get().then((value) =>
            MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
      }
    });
  }

  // Método para fazer login do usuário com email e senha.
  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString()); // Registra o erro no log.
      rethrow; // Relança o erro para ser tratado pelo chamador.
    }
  }

  // Método para registrar um novo usuário com senha.
  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);

      myUser.userId = user.user!.uid; // Define o userId do novo usuário.
      return myUser; // Retorna o usuário criado
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // Método para deslogar o usuário.
  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  // Método para definir os dados do usuário.
  @override
  Future<void> setUserData(MyUser myUser) async {
    try {
      // Salva os dados do usuário no Firestore.
      await usersCollection
          .doc(myUser.userId)
          .set(myUser.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
