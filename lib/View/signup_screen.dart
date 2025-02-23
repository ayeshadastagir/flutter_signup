import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:signup/Utils/app_colors.dart';
import '../Components/custom_button.dart';
import '../Components/custom_textfield.dart';
import '../Components/social_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  bool _isFormValid = false;

  void _validateForm() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const Center(
              child: Text(
                'Create Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: AppColors.bluecolor,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            const Center(
              child: Text(
                'Create an account so you can explore all the\nexisting jobs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  color: AppColors.blackcolor,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Form(
              key: _formKey,
              onChanged: _validateForm,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: CustomTextField(
                      hintText: "Email",
                      controller: _emailController,
                      validator: _validateEmail,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: CustomTextField(
                      hintText: "Password",
                      controller: _passwordController,
                      isPassword: true,
                      validator: _validatePassword,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: CustomTextField(
                      hintText: "Confirm Password",
                      controller: _confirmPasswordController,
                      isPassword: true,
                      validator: _validateConfirmPassword,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    text: "Sign up",
                    buttonColor: AppColors.bluecolor,
                    textColor: AppColors.whitecolor,
                    height: 45.h,
                    width: double.infinity,
                    onPressed: _isFormValid ? () {} : null,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: "Already have an account",
              buttonColor: AppColors.whitecolor,
              textColor: AppColors.greycolor,
              height: 50.h,
              width: double.infinity,
              onPressed: () {
                context.go('/login');
              },
            ),
            SizedBox(height: 20.h),
            const Text(
              "Or continue with",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                color: AppColors.bluecolor,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                    iconPath: 'assets/images/google.png',
                    height: 50.h,
                    width: 50.w,
                    onPressed: () {}),
                SizedBox(width: 10.w),
                SocialButton(
                    iconPath: 'assets/images/facebook.png',
                    height: 50.h,
                    width: 50.w,
                    onPressed: () {}),
                SizedBox(width: 10.w),
                SocialButton(
                    iconPath: 'assets/images/apple.png',
                    height: 50.h,
                    width: 50.w,
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}