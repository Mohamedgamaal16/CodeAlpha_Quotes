part of 'authors_cubit.dart';

@immutable
sealed class AuthorsState {}

final class AuthorsInitial extends AuthorsState {}

final class AuthorsSuccess extends AuthorsState {
  final AuthorModel authorModel;

  AuthorsSuccess( {required this.authorModel});
}

final class AuthorsLoading extends AuthorsState {}

final class AuthorsFaliure extends AuthorsState {
  final String errMessage;

  AuthorsFaliure({required this.errMessage});
}
