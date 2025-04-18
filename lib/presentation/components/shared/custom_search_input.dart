import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vesti_assessment_app/config/app_colors.dart';
import 'package:vesti_assessment_app/data/app_assets.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.kBorder)
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.searchIcon,
                  height: 18,
                  width: 18,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search ",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: AppColors.kBgDark,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),

        /// scan button
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.kBorder)
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              AppAssets.filterIcon,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
