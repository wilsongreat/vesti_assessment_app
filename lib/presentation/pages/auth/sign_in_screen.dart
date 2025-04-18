import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';
import 'package:vesti_assessment_app/presentation/components/shared/custom_btn.dart';
import 'package:vesti_assessment_app/presentation/components/shared/custom_text.dart';
import 'package:vesti_assessment_app/presentation/components/shared/custom_textfield.dart';
import 'package:vesti_assessment_app/presentation/components/shared/gap.dart';
import 'package:vesti_assessment_app/utils/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;
  bool? isRemember = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical:30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_back_sharp, ),
              Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(text: 'Let’s sign you in.',fontSize: 28,fontWeight: FontWeight.w700,),
                  TextView(text: 'Welcome back ! You’ve been missed.',color: AppColors.kFade,fontSize: 14,fontWeight: FontWeight.w500,),
                ],
              ),
              Gap(25),
              CustomTextfield(
                label: 'EMAIL *',
                hintText: 'ovie@wevesti.com',
                obscureText: false,
                isPassword: false,
              ),
              CustomTextfield(
                label: 'PASSWORD *',
                hintText: '************',
                isPassword: true,
                obscureText: _obscurePassword,
                toggleObscure: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: isRemember, onChanged: (newVal){
                        setState(() {
                          isRemember = newVal;
                        });
                      },activeColor: AppColors.kBlue,),
                      TextView(text: 'Remember me', fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.kBlue,)
                    ],
                  ),
                  TextView(text: 'Forgot Password?', fontSize: 14,fontWeight: FontWeight.w600,),

                ],
              ),
              Gap(30),

              CustomAppButton(
                voidCallback: (){
                  context.pushNamed(Constants.dashboard);
                },
                title: 'Sign In',isActive: true,)
            ],
          ),
        ),
      ),
    );
  }
}
