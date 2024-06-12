import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/utils/gradient_text.dart';
import 'package:quotes/features/authors/presentation/view/widgets/single_author_view_body.dart';

class SingleAuthorDisplay extends StatelessWidget {
  const SingleAuthorDisplay(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.link});
  final String title, subtitle, description, link;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.kPrimaryColor,
            title: GradientText(
              "Back",
              style: AppStyles.poppinsStyleBold24(context),
              gradient: const LinearGradient(colors: AppColors.nameGradient),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: SingleAuthorViewBody(
                title: title,
                subtitle: subtitle,
                description: description,
                link: link,
              )),
            ],
          )),
    );
  }
}
