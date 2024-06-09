import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quotes/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpConfirmPassword = TextEditingController();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();

  signUp() async {
    emit(AuthLoading());
    final response = await authRepo.signUp(
        email: signUpEmail.text,
        password: signUpPassword.text,
        confirmPassword: signUpConfirmPassword.text,
        userName: signUpName.text);
    response.fold((signUpModel) => emit(AuthSuccessful()),
        (err) => emit(AuthFaliure(errMessage: err)));
  }

  login() async {
    emit(AuthLoading());
    final response = await authRepo.signIn(
        email: signInEmail.text, password: signInPassword.text);
    response.fold((signUpModel) => emit(AuthSuccessful()),
        (err) => emit(AuthFaliure(errMessage: err)));
  }
}
