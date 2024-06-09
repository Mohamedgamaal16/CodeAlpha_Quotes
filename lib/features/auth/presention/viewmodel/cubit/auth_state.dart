part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthSuccessful extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthFaliure extends AuthState {
  final String errMessage;

  AuthFaliure({required this.errMessage});
}
