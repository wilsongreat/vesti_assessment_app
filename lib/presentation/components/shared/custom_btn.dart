import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';



class CustomAppButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? innActiveColor;
  final VoidCallback? voidCallback;
  final bool? isActive;
  final bool? withEmoji;
  final double? radius;
  final double? width;
  final double? height;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? borderColor;

  const CustomAppButton({
    super.key,
    this.title,
    this.color,
    this.innActiveColor,
    this.isActive,
    this.withEmoji,
    this.voidCallback,
    this.radius,
    this.textColor,
    this.width,
    this.fontWeight,
    this.height,
    this.fontSize, this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive == true ? voidCallback : () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        height: height ?? 48,
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
          color: isActive == true
              ? color ?? AppColors.kBlue
              : color ?? AppColors.kBlue.withValues(alpha: 0.2),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
          border: Border.all(color: borderColor ?? AppColors.kTransparent )
        ),
        child: Center(
            child: Text(
              title?? '  ',
              style: GoogleFonts.lato(
                  color: textColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  fontSize: fontSize ?? 16),
            )),
      ),
    );
  }
}