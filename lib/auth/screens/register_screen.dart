
import 'package:flutter/material.dart';
import 'package:glass_login/utils/styles/fadeanimation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:string_validator/string_validator.dart';
import '../../utils/styles/app_colors.dart';
import '../../utils/styles/text_field_style.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.fromSize(
        size: MediaQuery.sizeOf(context),
        child: Stack(
          children: [
            Positioned(
              left: 30,
              right: 30,
              bottom: 30,
              child: FadeInAnimation(
                delay: 1,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.whiteColor.withOpacity(.8),
                  ),
                  child: Form(
                    key: fKey,
                    child: Column(
                      textDirection: TextDirection.ltr,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign up',
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryHighContrast,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your mail";
                            } else if (!isEmail(value)) {
                              return "Please enter a valid mail";
                            }
                            return null;
                          },
                          style: textFieldTextStyle(),
                          decoration: textFieldDecoration('Name'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your name";
                            } else if (value.length < 4) {
                              return "Name must have at least 4 chars";
                            }
                            return null;
                          },
                          style: textFieldTextStyle(),
                          decoration: textFieldDecoration('Email'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your name";
                            } else if (value.length < 4) {
                              return "Name must have at least 4 chars";
                            }
                            return null;
                          },
                          style: textFieldTextStyle(),
                          decoration: textFieldDecoration('Password'),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.whiteColor,
                            ),
                            onPressed: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              widget.controller.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            },
                            child: Text(
                              "Create account",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' have an account ? ',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: AppColors.primaryDark,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                )),
                            const SizedBox(
                              width: 2.5,
                            ),
                            InkWell(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                widget.controller.animateToPage(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Text('Log In ',
                                  style: GoogleFonts.poppins(
                                    color: AppColors.primaryHighContrast,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
