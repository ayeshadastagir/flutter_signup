import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:signup/Utils/app_colors.dart';
import '../Components/custom_button.dart';
import '../Components/custom_textfield.dart';
import '../Components/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be empty";
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}\$');
    if (!emailRegex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body: Column(
        children: [
          SizedBox(height: 20.h),
          const Center(
            child: Text(
              'Login here',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: AppColors.bluecolor,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          const Center(
            child: Text(
              "Welcome back, you've\nbeen missed!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: AppColors.blackcolor,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Form(
            key: _formKey,
            onChanged: _validateForm,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              text: "Forgot your password?",
              buttonColor: AppColors.whitecolor,
              textColor: AppColors.bluecolor,
              height: 22.h,
              width: 220.w,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
              text: "Sign in",
              buttonColor: AppColors.bluecolor,
              textColor: AppColors.whitecolor,
              height: 45.h,
              width: double.infinity,
              onPressed: _isFormValid ? () {} : null,
            ),
          ),
          SizedBox(height: 10.h),
          CustomButton(
            text: "Create new account",
            buttonColor: AppColors.whitecolor,
            textColor: AppColors.greycolor,
            height: 50.h,
            width: double.infinity,
            onPressed: () {
              context.go('/register');
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
    );
  }
}
