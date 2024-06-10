part of 'get_user_data_cubit.dart';

@immutable
sealed class GetUserDataState {}

final class GetUserDataInitial extends GetUserDataState {}
final class GetUserDataSuccess extends GetUserDataState {
  final UserModel userModel;

  GetUserDataSuccess({required this.userModel});
}
final class GetUserDataFaliure extends GetUserDataState {

  final String errMessage;

  GetUserDataFaliure({required this.errMessage});
}
final class GetUserDataLoading extends GetUserDataState {}

final class SetGender extends GetUserDataState {}
final class UploadProfilePic extends GetUserDataState {}