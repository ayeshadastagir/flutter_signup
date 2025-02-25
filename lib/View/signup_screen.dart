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
  bool _isFormValid = true;
  bool _hasAttemptedSubmit = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    if (_hasAttemptedSubmit) {
      setState(() {
        _isFormValid = _formKey.currentState?.validate() ?? false;
      });
    }
  }

  void _attemptSignUp() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _hasAttemptedSubmit = true;
      _isFormValid = isValid;
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Image.asset(
                  'assets/images/signup.png',
                  width: 110.w,
                  height: 110.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'Create an account so you can explore all the\nexisting jobs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                    color: AppColors.blackcolor,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Form(
                key: _formKey,
                autovalidateMode: _hasAttemptedSubmit
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
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
                      onPressed: _hasAttemptedSubmit && !_isFormValid
                          ? null
                          : _attemptSignUp,
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: "Already have an account",
                buttonColor: AppColors.whitecolor,
                textColor: AppColors.greycolor,
                height: 50.h,
                onPressed: () {
                  context.go('/login');
                },
              ),
              Text(
                "Or continue with",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
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
                      onPressed: () {}),
                  SizedBox(width: 10.w),
                  SocialButton(
                      iconPath: 'assets/images/facebook.png',
                      onPressed: () {}),
                  SizedBox(width: 10.w),
                  SocialButton(
                      iconPath: 'assets/images/apple.png',
                      onPressed: () {}),
                ],
              ),
            ],
          ),
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