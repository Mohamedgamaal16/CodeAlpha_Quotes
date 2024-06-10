part of 'upload_pic_cubit.dart';

@immutable
sealed class UploadPicState {}

final class UploadPicInitial extends UploadPicState {}
final class UploadPicSuccess extends UploadPicState {}
