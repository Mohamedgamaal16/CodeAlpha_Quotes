import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quotes/features/profile/presentation/view_models/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:quotes/features/profile/presentation/view_models/upload_pic/upload_pic_cubit.dart';
import 'package:quotes/features/profile/presentation/views/widgets/name_and_email.dart';
import 'package:share_plus/share_plus.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
  });

  static XFile? test;
 static  GetUserDataCubit? profileCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadPicCubit, UploadPicState>(
        builder: (context, state) {
      UploadPicCubit uploadProfilePic = BlocProvider.of(context);

      return Row(
        children: [
          SizedBox(
              width: 130,
              height: 130,
              child: uploadProfilePic.pic == null
                  ? UnUploadedPic(uploadPicCubit: uploadProfilePic)
                  : UplodaedPic(profileCubit: uploadProfilePic)),
          const SizedBox(
            width: 16,
          ),
          const NameAndEmail()
        ],
      );
    });
  }
}


class UnUploadedPic extends StatelessWidget {
  const UnUploadedPic({
    super.key,
    required this.uploadPicCubit,
  });

  final UploadPicCubit uploadPicCubit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
      backgroundImage: const AssetImage("assets/images/avatar.png"),
      child: Stack(
        children: [
          Positioned(
            bottom: 5,
            right: 5,
            child: GestureDetector(
              onTap: () async {
                ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  uploadPicCubit.uploadProfilePic(value!);
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UplodaedPic extends StatelessWidget {
  const UplodaedPic({
    super.key,
    required this.profileCubit,
  });

  final UploadPicCubit profileCubit;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: FileImage(File(profileCubit.pic!.path)),
      child: Stack(
        children: [
          Positioned(
            bottom: 5,
            right: 5,
            child: GestureDetector(
              onTap: () async {
                ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((value) {
                  profileCubit.uploadProfilePic(value!);
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.camera_alt_sharp,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
