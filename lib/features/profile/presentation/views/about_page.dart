
import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_styles.dart';
import 'package:quotes/core/utils/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Climb Up',
          style: AppStyles.poppinsStyleSemiBold14(context),
        ),
        foregroundColor: AppColors.kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'Welcome to Climb Up!',
                style: AppStyles.poppinsStyleBold24(context),
              ),
              const SizedBox(height: 20),
              Text(
                'About Us',
                style: AppStyles.poppinsStyleBold18(context),
              ),
              const SizedBox(height: 10),
              Text(
                'Climb Up is a mobile app designed to support local businesses by providing them with the platform to showcase and sell their products in our marketplace.',
                textAlign: TextAlign.center,
                style: AppStyles.poppinsStyleMedium16(context),
              ),
              const SizedBox(height: 20),
              Text(
                'Our Mission',
                style: AppStyles.poppinsStyleBold18(context),
              ),
              const SizedBox(height: 10),
              Text(
                'At Climb Up, we believe in empowering local businesses. Our mission is to bridge the gap between local sellers and customers by providing a convenient and user-friendly platform for buying and selling.',
                textAlign: TextAlign.center,
                style: AppStyles.poppinsStyleMedium16(context),
              ),
              const SizedBox(height: 20),
              Text(
                'Get Started',
                style: AppStyles.poppinsStyleBold18(context),
              ),
              const SizedBox(height: 10),
              Text(
                'Download Climb Up now and start exploring the vibrant marketplace of local businesses!',
                textAlign: TextAlign.center,
                style: AppStyles.poppinsStyleMedium16(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
