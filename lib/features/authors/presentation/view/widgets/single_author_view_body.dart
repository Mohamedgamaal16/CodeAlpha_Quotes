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
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration: const BoxDecoration(
        color: AppColors.kPrimaryColor,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
                            const Spacer(flex: 2,),

              Text(
                "Name: $title",
                textAlign: TextAlign.center,
                style: AppStyles.poppinsStyleBold32(context)
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10,),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: AppStyles.poppinsStyleregular20(context)
                    .copyWith(color: Colors.white),
              ),              const SizedBox(height: 10,),

              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 200),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/background1.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20,bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            description,
                            style: AppStyles.poppinsStyleSemiBold18(context).copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(flex: 2,),
              CustomButton(
                labelName: "Know More",
                onPressed: () {
                  _launchUrl();
                },
                color: Colors.white,
                textColor: AppColors.kPrimaryColor,
              ),              const Spacer(flex: 2,),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    Uri _url = Uri.parse(link);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
