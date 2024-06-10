import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'upload_pic_state.dart';

class UploadPicCubit extends Cubit<UploadPicState> {
  UploadPicCubit() : super(UploadPicInitial());
    XFile? pic;

  uploadProfilePic(XFile image) {
    pic = image;
    emit(UploadPicSuccess());
  }
}
