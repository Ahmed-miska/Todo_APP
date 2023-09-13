import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  registeration({
    required TextEditingController emailControlar,
    required TextEditingController passControlar,
  }) async {
    emit(RegisterLoading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControlar.text,
        password: passControlar.text,
      );
      print(user.user!.email);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure('The password is too weak.'));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure('The account already exists for that email.'));
        print('The account already exists for that email.');
      } else {
        emit(RegisterFailure(e.toString()));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
