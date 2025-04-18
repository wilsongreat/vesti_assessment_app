import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';
import 'package:vesti_assessment_app/data/app_assets.dart';
import 'package:vesti_assessment_app/src/components.dart';
import 'package:vesti_assessment_app/utils/constants.dart';
import 'package:vesti_assessment_app/utils/screen_utils.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              AppAssets.onboardImg2,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: fullHeight(context),
            width: fullWidth(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        AppAssets.logoWhite,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomAppButton(
                        title: 'Create an account',
                        isActive: true,
                        voidCallback: (){
                          context.pushNamed(Constants.signIn);
                        },
                      ),
                      Gap(20),
                      TextView(
                        text: 'Already have an account? Sign in',
                        color: AppColors.kWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
