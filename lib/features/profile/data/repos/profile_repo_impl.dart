import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/endpoint.dart';
import 'package:quotes/core/errors/exceptions.dart';
import 'package:quotes/core/utils/app_router.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/service_locator.dart';
import 'package:quotes/features/profile/data/models/change_pass_model.dart';
import 'package:quotes/features/profile/data/models/profile_model.dart';
import 'package:quotes/features/profile/data/models/user_model.dart';
import 'package:quotes/features/profile/data/repos/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepoImpl implements ProfileRepo {
  // @override
  // Future loadData(
  //   int genderIndex,
  //   ProfileModel profileModel,
  //   List<String> genders,
  // ) async {}
  final ApiConsumer api;

  ProfileRepoImpl({required this.api});
  

  @override
  Future logOut(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", false);
    // prefs.setBool("onBoardingDone", false);

    if (context.mounted) {
      GoRouter.of(context).pushReplacement(AppRouter.kLogInView);
    }
  }

  @override
  Future<Either<String, UserModel>> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString(ApiKey.id);

    try {
      
      final response = await api.get(EndPoint.getUserData(id));
      final user = UserModel.fromJson(response);

      return Right(user);
    } on AuthServerException catch (e) {
      return Left('Failed to fetch user data: $e');
    }
  }

  @override
  Future<Either<String, String>> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword}) async {
    try {
      final response = await api.patch(EndPoint.changePassword, data: {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "passwordConfirm": confirmPassword,
      });

      ChangePasswordModel data = ChangePasswordModel.fromJson(response);
      return right(data.message);
    } on AuthServerException catch (e) {
      return left(e.errModel.message);
    }
  }
}
