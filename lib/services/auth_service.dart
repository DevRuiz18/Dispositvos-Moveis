import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthException implements Exception{
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier{
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user){
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser(){
    usuario = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String password) async{
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password'){
        throw AuthException('The Password is too weak.');
      }else if(e.code == 'email-already-in-use'){
        throw AuthException('Email already exists.');
      }
    }
  }

  login(String email, String password) async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found'){
        throw AuthException('Informed Email is not registered. Please Sign up.');
      }else if(e.code == 'wrong-password'){
        throw AuthException('Wrong Password.');
      }
    }
  }

  logout() async{
    await _auth.signOut();
    _getUser();
  }

}