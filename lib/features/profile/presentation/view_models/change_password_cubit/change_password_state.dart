part of 'change_password_cubit.dart';

abstract class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}
final class ChangePasswordSuccess extends ChangePasswordState {
  final String message;

  ChangePasswordSuccess({required this.message});
}
final class ChangePasswordLoading extends ChangePasswordState {}
final class ChangePasswordFaliure extends ChangePasswordState {
  final String errMsg;

  ChangePasswordFaliure({required this.errMsg});
}
