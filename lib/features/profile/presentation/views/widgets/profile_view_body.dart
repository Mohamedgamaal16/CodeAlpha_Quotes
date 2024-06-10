
import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/features/profile/presentation/views/widgets/profile_box.dart';
import 'package:quotes/features/profile/presentation/views/widgets/profile_tiles_list_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        Text(
          'My Profile',
          style: AppStyles.interStyleBold12(context).copyWith(
            fontSize: 20,color: Colors.white
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const ProfileBox(),
        const ProfileTilesListView()
      ],
    );
  }
}
