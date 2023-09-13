import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  login({
    required TextEditingController emailControlar,
    required TextEditingController passControlar,
  }) async {
    emit(LoginLoading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailControlar.text,
        password: passControlar.text,
      );
      print(user.user!.email);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password '));
        print('Wrong password ');
      } else {
        emit(LoginFailure(e.toString()));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
