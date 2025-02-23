import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:signup/Utils/app_colors.dart';
import '../Components/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Center(
              child: Image.asset(
                'assets/images/welcome2.png',
                width: 310.w,
                height: 300.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.h),
            const Text(
              'Discover Your\nDream Job here',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: AppColors.bluecolor,
              ),
            ),
            SizedBox(height: 15.h),
            const Text(
              'Explore all the existing job roles based on your\ninterest and study major',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                color: AppColors.blackcolor,
              ),
            ),
            SizedBox(height: 35.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "Login",
                  buttonColor: AppColors.bluecolor,
                  textColor: AppColors.whitecolor,
                  height: 50.h,
                  width: 140.w,
                  onPressed: () {
                    context.go('/login');
                  },
                ),
                CustomButton(
                  text: "Register",
                  buttonColor: AppColors.whitecolor,
                  textColor: AppColors.blackcolor,
                  height: 50.h,
                  width: 140.w,
                  onPressed: () {
                    context.go('/register');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}