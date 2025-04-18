import 'package:flutter/material.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';
import 'package:vesti_assessment_app/presentation/components/shared/custom_text.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final String hintText;
  final bool? isPassword;
  final bool? obscureText;
  final VoidCallback? toggleObscure;

  const CustomTextfield({super.key, required this.label, required this.hintText,  this.isPassword,  this.obscureText, this.toggleObscure});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: TextFormField(
                obscureText: obscureText!,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: AppColors.kFade,
                    fontSize: 13,
                    fontWeight: FontWeight.w300
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 16),
                  suffixIcon: isPassword!
                      ? IconButton(
                    icon: Icon(
                      obscureText!
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: toggleObscure,
                  )
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:  BorderSide(color: AppColors.kFade),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:  BorderSide(color: AppColors.kFade),
                  ),
                ),
                style: const TextStyle(
                    fontSize: 16, color: Color(0xFF455A64)),
              ),
            ),
            Positioned(
              left: 16,
              top: 0,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextView(
                  text: label,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263238),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}



