import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';
import 'package:quotes/core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleAuthorViewBody extends StatelessWidget {
  const SingleAuthorViewBody(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.link});
  final String title, subtitle, description, link;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 1,
          ),
          child: Container(
            color: AppColors.kPrimaryColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Name: $title",
                      textAlign: TextAlign.center,
                      style: AppStyles.poppinsStyleBold32(context)
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: AppStyles.poppinsStyleregular20(context)
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 200,
                            maxHeight: constraints.maxHeight * 0.5,
                          ),
                          child: Container(
                            width: constraints.maxWidth * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/background1.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                child: Text(
                                  description,
                                  style:
                                      AppStyles.poppinsStyleSemiBold18(context)
                                          .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      labelName: "Know More",
                      onPressed: () {
                        _launchUrl();
                      },
                      color: Colors.white,
                      textColor: AppColors.kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<void> _launchUrl() async {
    Uri _url = Uri.parse(link);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
