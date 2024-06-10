import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/features/profile/data/repos/profile_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.profileRepo) : super(ChangePasswordInitial());

  final ProfileRepo profileRepo;

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();

  changePassword() async {
    // emit(ChangePasswordLoading());
    final response = await profileRepo.changePassword(
        oldPassword: oldPassword.text,
        newPassword: newPassword.text,
        confirmPassword: confirmPassword.text);

    response.fold((err) => emit(ChangePasswordFaliure(errMsg: err)),
        (success) => ChangePasswordSuccess(message: success));
  }
}
