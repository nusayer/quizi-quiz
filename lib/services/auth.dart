import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizi_quiz/models/user.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }
  //sign in
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }
  //register
   Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }
  //password reset
   Future<String> sendPasswordResetEmail(String email) async {
     try{
      await _auth.sendPasswordResetEmail(email: email);
       return email;
     }
     catch (error) {
      print(error.toString());
      return null;
     }

       }
        // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
     }

