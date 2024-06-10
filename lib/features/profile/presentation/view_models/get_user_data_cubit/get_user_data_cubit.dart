import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:quotes/core/utils/service_locator.dart';
import 'package:quotes/features/profile/data/models/user_model.dart';
import 'package:quotes/features/profile/data/repos/profile_repo.dart';
import 'package:quotes/features/profile/data/repos/profile_repo_impl.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit(this.profileRepo) : super(GetUserDataInitial());
  final ProfileRepo profileRepo;


  fetchUserData() async {
    emit(GetUserDataLoading());
    final user = await profileRepo.fetchUserData();
    user.fold((err) => emit(GetUserDataFaliure(errMessage: err)),
        (success) => emit(GetUserDataSuccess(userModel: success)));
  }


  

  void logOut(BuildContext context) {
  profileRepo.logOut(context);
  }

  
}
